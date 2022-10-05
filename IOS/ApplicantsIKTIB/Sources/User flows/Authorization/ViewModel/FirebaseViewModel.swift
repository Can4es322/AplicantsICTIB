import FirebaseAuth

class FirebaseViewModel: ObservableObject {

	init() {
		self.phoneNumber = UserDefaults.standard.object(forKey: "phoneNumber") as? String ?? "1"
	}

	@Published var phoneNumber = "1" {
		didSet {
			UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
		}
	}

	@Published var errorMsg = ""
	@Published var id: String?
	@Published var token: String?
	@Published var correctPhone = false

	func getUserID() -> String? {
		if Auth.auth().currentUser != nil {
			return Auth.auth().currentUser?.uid
		} else {
			return ""
		}
	}

	func signOutPerson() {
		let firebaseAuth = Auth.auth()
		do {
			try firebaseAuth.signOut()
		} catch let signOutError as NSError {
			print("Error signing out: %@", signOutError)
		}
	}

	func checkPersonLogin(isSuccessEnter: Bool) -> Int {
		if Auth.auth().currentUser != nil && isSuccessEnter == true {
			return 2
		}

		return 1
	}

	func verifyUser() async throws -> Bool {
		// Удалить при тестировании на телефоне
		Auth.auth().settings?.isAppVerificationDisabledForTesting = true

		self.id = try await PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil)
		if self.id != nil {
			return true
		} else {
			return false
		}
	}

	func authCodeRegistration(UUID: String?, code: String) async throws {
		let credential = PhoneAuthProvider.provider().credential(withVerificationID: UUID ?? "", verificationCode: code)

		if UUID == nil {
			print("UUID = nil")
		} else {
			print("OK")
			print(UUID!)
		}
		try await Auth.auth().signIn(with: credential)

		let currentUser = Auth.auth().currentUser
		token = try await currentUser?.getIDToken()
		print(token ?? "token empty")

	}

	func registrationUserEmail(email: String, password: String) async throws -> Bool {
		let user = try await Auth.auth().createUser(withEmail: email, password: password)
		self.token = try await user.user.getIDToken()
		if token != nil {
			print(token ?? "token empty")
			return true
		} else {
			return false
		}
	}

	func loginUserEmail(email: String, password: String) async throws {
		let user = try await Auth.auth().signIn(withEmail: email, password: password)
		self.token = try await user.user.getIDToken()
		if token != nil {
			print(token ?? "token empty")
		} else {
			print("errr")
		}
	}
}

import FirebaseAuth

class FirebaseViewModel: ObservableObject {
  @Published var phoneNumber = "1"
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

  func verifyUser() async throws {
    // Удалить при тестировании на телефоне
    Auth.auth().settings?.isAppVerificationDisabledForTesting = true
    
    self.id = try await PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil)
    print(self.id ?? "empty")
    
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
}

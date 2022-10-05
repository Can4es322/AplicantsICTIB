import SwiftUI
import Combine

class LoginViewModel: ObservableObject {

    init() {
        self.isSuccessEnter = UserDefaults.standard.object(forKey: "isSuccessEnter") as? Bool ?? false
        self.firstEntry = UserDefaults.standard.object(forKey: "firstEntry") as? Bool ?? true
        self.registrationButton = UserDefaults.standard.object(forKey: "registrationButton") as? Bool ?? false
    }

	@Published var email = ""
	@Published var password = ""
	@Published var authorizationMethodEmail = true
	@Published var authorizationMethodPhone = false
    @Published var code = ""
    @Published var number = ""
    @Published var errorMsg = ""
    @Published var registrationButton = false {
        didSet {
            UserDefaults.standard.set(registrationButton, forKey: "registrationButton")
        }
    }
    @ObservedObject var firebaseAuth = FirebaseViewModel()
    @Published var buttonInfoCode = 1
    @Published var changeText = L10n.repeatCodeButton
    @Published var currentSecond = 59
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var text = ""
    @Published var agreeCode = false
    @Published var isAuthorization = 1
    @Published var selectedTab = 0
    @Published var tempIndex = 0

    @Published var firstEntry = true {
        didSet {
            UserDefaults.standard.set(firstEntry, forKey: "firstEntry")
        }
    }

    @Published var isSuccessEnter = false {
        didSet {
            UserDefaults.standard.set(isSuccessEnter, forKey: "isSuccessEnter")
        }
    }

    func checkLogin() {
        isAuthorization = firebaseAuth.checkPersonLogin(isSuccessEnter: isSuccessEnter)
    }
    
    func infoCode() {
        var text = L10n.repeatCodeButton

        if buttonInfoCode == 2 {
            text = L10n.codeRepeatSend
        }
        changeText = text
    }

    func switchingState() {
        if buttonInfoCode == 2 {
            if currentSecond > 0 {
                currentSecond -= 1
            } else {
                changeText = L10n.codeNotRecived
                buttonInfoCode = 3
            }
        }
    }
    
    func phonePromt() -> Bool {
        return  registrationButton && firebaseAuth.phoneNumber.count != 18 ? true : false
    }

    func checkPhoneNumber() async throws {
        if firebaseAuth.phoneNumber.count == 18 {
            try await registrationButton = firebaseAuth.verifyUser()
        }
    }
	
	func registrationUserEmail() async throws {
		try await registrationButton = firebaseAuth.registrationUserEmail(email: self.email, password: self.password)
		if !registrationButton {
			errorMsg = "Ошибка"
		}
	}
	
	func loginUserEmail() async throws {
		try await firebaseAuth.loginUserEmail(email: self.email, password: self.password)
	}
}

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {

  init() {
      self.isSuccessEnter = UserDefaults.standard.object(forKey: "isSuccessEnter") as? Bool ?? false
  }

  @Published var code = ""
  @Published var number = ""
  @Published var errorMsg = ""
  @Published var registrationButton: Bool = false
  @ObservedObject var firebaseAuth = FirebaseViewModel()
  @Published var buttonInfoCode = 1
  @Published var changeText = L10n.repeatCodeButton
  @Published var currentSecond = 59
  @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  @Published var text = ""
  @Published var agreeCode = false
  @Published var isAuthorization = 1

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
    return registrationButton && firebaseAuth.phoneNumber.count != 18 ? true : false
  }
  
  func checkPhoneNumber() async throws {
    if firebaseAuth.phoneNumber.count == 18 {
      try await firebaseAuth.verifyUser()
      registrationButton = true
    }
  }
}

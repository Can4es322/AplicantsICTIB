import SwiftUI

struct StartView: View {
  @ObservedObject var loginData = LoginViewModel()

  var body: some View {
    VStack {
      if loginData.firstEntry {
        OnboardingPage1View(isAuthorization: $loginData.isAuthorization, firstEntry: $loginData.firstEntry)
      } else {
        switch loginData.isAuthorization {
        case 2:
          MainEventsView(isAuthorization: $loginData.isAuthorization)
        case 3:
          MainGuestView(isAuthorization: $loginData.isAuthorization)
        default:
          AuthorizationView(isAuthorization: $loginData.isAuthorization)
        }
      }
    }
    .task {
      loginData.checkLogin()
    }
  }
}

struct StartView_Previews: PreviewProvider {
  static var previews: some View {
    StartView()
  }
}

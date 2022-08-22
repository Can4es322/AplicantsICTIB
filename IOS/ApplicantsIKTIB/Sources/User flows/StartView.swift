import SwiftUI

struct StartView: View {
  @ObservedObject var loginData = LoginViewModel()

  var body: some View {
    VStack {
      switch loginData.isAuthorization {
      case 2:
        MainEventsView(isAuthorization: $loginData.isAuthorization)
      case 3:
        MainGuestView(isAuthorization: $loginData.isAuthorization)
      default:
        Authorization(isAuthorization: $loginData.isAuthorization)
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

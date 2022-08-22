import SwiftUI

struct CodeView: View {
  
  @ObservedObject var loginData = LoginViewModel()
  @Binding var isAuthorization: Int
  var phoneNumber: String
  var id: String?
  
  let insetTextTitle = EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16)
  let insetTextField = EdgeInsets(top: 60, leading: 16, bottom: 0, trailing: 16)
  let insetButtonError = EdgeInsets(top: 25, leading: 16, bottom: 0, trailing: 16)
  let insetButton = EdgeInsets(top: 32, leading: 16, bottom: 0, trailing: 16)
  
  var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 16) {
        Text(L10n.enterCode)
          .font(Font.system(size: 20, weight: .bold ))
        
        Group {
          Text(L10n.textPart1)
            .foregroundColor(Color(Asset.gray1.name))
          + Text("\(phoneNumber) ").bold() +
          Text(L10n.textPart2)
            .foregroundColor(Color(Asset.gray1.name))
          
        }
        .font(.system(size: 20, weight: .regular))
        
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(insetTextTitle)
      
      TextField(
        L10n.infoCodeTextField,
        text: $loginData.code)
      .padding(.horizontal, 16)
      .frame(maxWidth: .infinity, maxHeight: 44)
      .foregroundColor(Color(Asset.gray1.name))
      .border(Color(Asset.gray1.name))
      .padding(insetTextField)
      
      Button {
        if loginData.buttonInfoCode == 1 {
          loginData.buttonInfoCode = 2
          loginData.infoCode()
        }
        Task {
          try await loginData.firebaseAuth.verifyUser()
        }
      } label: {
        Text(loginData.changeText)
          .foregroundColor(Color(Asset.gray1.name))
          .underline()
        
        if loginData.buttonInfoCode == 2 {
          Text("0:\(loginData.currentSecond)")
            .foregroundColor(.black)
            .onReceive(loginData.timer) { _ in
              loginData.switchingState()
            }
        }
      }
      .padding(insetButton)
      .frame(maxWidth: .infinity, alignment: .leading)
      
      NavigationLink(
        destination: AdditinalRegistrationView(
          token: loginData.firebaseAuth.token,
          isAuthorization: $isAuthorization),
        isActive: $loginData.agreeCode
      ) {
        Button {
          Task {
            try await loginData.firebaseAuth.authCodeRegistration(UUID: id, code: loginData.code)
            loginData.agreeCode = true
          }
        } label: {
          Text(L10n.textCodeButton)
            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .background(Color(Asset.blue2.name))
            .cornerRadius(8)
        }
      }
      .padding(insetButton)
      
      Spacer()
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(leading: BackButton())
  }
}

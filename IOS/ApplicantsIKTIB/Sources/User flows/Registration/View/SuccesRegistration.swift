import SwiftUI

struct SuccesRegistration: View {
  @Binding var isAuthorization: Int
 
  var body: some View {
    VStack {
      Text(L10n.succesRegistrationTitle)
        .frame(maxWidth: .infinity, alignment: .center)
        .font(.system(size: 24, weight: .regular))
        .multilineTextAlignment(.center)
        .padding(.top, 127)
      
      Image("succesReg")
        .padding(.top, 43)
      
      Spacer()
      
      Button {
        isAuthorization = 2
      } label: {
        Text(L10n.succesRegistrationButton)
          .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.white)
          .background(Color(Asset.blue2.name))
          .cornerRadius(8)
      }
      .padding(.horizontal, 16)
      .padding(.bottom, 70)
      
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
  }
}

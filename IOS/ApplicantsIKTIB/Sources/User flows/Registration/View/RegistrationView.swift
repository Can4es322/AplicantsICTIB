import SwiftUI

struct RegistrationView: View {
    @StateObject var loginData = LoginViewModel()
    @Binding var isAuthorization: Int
    
    var body: some View {
        VStack {
			HStack(spacing: 18) {
				Button {
					loginData.authorizationMethodEmail.toggle()
					loginData.authorizationMethodPhone = false
				} label: {
					HStack(spacing: 14) {
						Image(systemName: loginData.authorizationMethodEmail ? "record.circle" : "circle")
							.resizable()
							.frame(width: 18, height: 18)
							.foregroundColor(loginData.authorizationMethodEmail ? .blue : .gray)
							.font(.system(size: 30, weight: .bold, design: .default))

						Text(L10n.emailText)
							.font(.system(size: 14, weight: .regular))
							.foregroundColor(.black)
					}
				}

				Button {
					loginData.authorizationMethodPhone.toggle()
					loginData.authorizationMethodEmail = false
				} label: {
					HStack(spacing: 14) {
						Image(systemName: loginData.authorizationMethodPhone ? "record.circle" : "circle")
							.resizable()
							.frame(width: 18, height: 18)
							.foregroundColor(loginData.authorizationMethodPhone ? .blue : .gray)
							.font(.system(size: 30, weight: .bold, design: .default))

						Text(L10n.phoneText)
							.font(.system(size: 14, weight: .regular))
							.foregroundColor(.black)
					}
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding([.leading, .top], 20)
			
			if loginData.authorizationMethodEmail {
				EmailMethodRegistration(isAuthorization: $isAuthorization)
			} else if loginData.authorizationMethodPhone {
				PhoneMethodRegistration(isAuthorization: $isAuthorization)
			}
   
            Spacer()
        }
		.environmentObject(loginData)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

import SwiftUI

struct RegistrationViewForEnterToProfile: View {
    @StateObject var loginData = LoginViewModel()
    @Binding var isAuthorization: Int
    
    let insetTextTitle = EdgeInsets(top: 14, leading: 16, bottom: 0, trailing: 16)
    let insetTextField = EdgeInsets(top: 91, leading: 16, bottom: 0, trailing: 16)
    let insetButton = EdgeInsets(top: 71, leading: 16, bottom: 0, trailing: 16)

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
				EmailMethod(isAuthorization: $isAuthorization)
			} else if loginData.authorizationMethodPhone {
				PhoneMethod(isAuthorization: $isAuthorization)
			}
            Spacer()
        }
		.environmentObject(loginData)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

import SwiftUI

struct EmailMethod: View {
	@EnvironmentObject var loginData: LoginViewModel
	@ObservedObject var response = ServerHandler()
	let insetTextTitle = EdgeInsets(top: 14, leading: 16, bottom: 0, trailing: 16)
	let insetTextFieldEmail = EdgeInsets(top: 91, leading: 16, bottom: 0, trailing: 16)
	let insetTextFieldPassword = EdgeInsets(top: 14, leading: 16, bottom: 0, trailing: 16)
	let insetButton = EdgeInsets(top: 71, leading: 16, bottom: 0, trailing: 16)
	@Binding var isAuthorization: Int
	
	var body: some View {
		VStack {
			VStack(alignment: .leading, spacing: 12) {
				Text(L10n.phoneTextAuthorization)
					.font(Font.system(size: 20, weight: .bold ))
				
				Text(L10n.phoneTextAuthorizationDescription)
					.foregroundColor(Color(Asset.gray1.name))
					.font(.system(size: 16, weight: .regular))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(insetTextTitle)

			TextField(
				L10n.phoneTextFieldEmail,
				text: $loginData.email)
			.padding(.horizontal, 16)
			.frame(maxWidth: .infinity)
			.frame(height: 44)
			.foregroundColor(Color(Asset.gray1.name))
			.border(Color(Asset.gray1.name))
			.padding(insetTextFieldEmail)

			SecureField(
				L10n.phoneTextFieldPassword,
				text: $loginData.password)
			.padding(.horizontal, 16)
			.frame(maxWidth: .infinity, maxHeight: 44)
			.frame(height: 44)
			.foregroundColor(Color(Asset.gray1.name))
			.border(Color(Asset.gray1.name))
			.padding(insetTextFieldPassword)

			if response.isErrorEmail == nil && response.isTappedButton {
				Text(L10n.errorEmailIsNil)
					.font(.system(size: 16, weight: .semibold))
					.foregroundColor(.red)
			}

			if response.isErrorEmail == false {
				Text(L10n.errorTextEmail)
					.font(.system(size: 16, weight: .semibold))
					.foregroundColor(.red)
			}

			Button {
				Task {
					try await response.checkEmail(email: loginData.email)
					response.isTappedButton = true
					if response.isErrorEmail == true {
						try await loginData.loginUserEmail()
						try await response.sendDataLogin(idToken: loginData.firebaseAuth.token)

						if response.isSuccesLogin {
							isAuthorization = 2
						}
					}
				}
			} label: {
				Text(L10n.textCodeButton)
					.frame(maxWidth: .infinity, alignment: .center)
					.frame(height: 44)
					.font(.system(size: 16, weight: .bold))
					.foregroundColor(.white)
					.background(Color(Asset.blue2.name))
					.cornerRadius(8)
			}
			.padding(insetButton)
		}
	}
}

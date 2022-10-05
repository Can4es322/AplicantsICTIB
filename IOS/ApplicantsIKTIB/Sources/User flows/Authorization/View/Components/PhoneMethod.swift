import SwiftUI

struct PhoneMethod: View {
	@EnvironmentObject var loginData: LoginViewModel
	let insetTextTitle = EdgeInsets(top: 14, leading: 16, bottom: 0, trailing: 16)
	let insetTextField = EdgeInsets(top: 91, leading: 16, bottom: 0, trailing: 16)
	let insetButton = EdgeInsets(top: 71, leading: 16, bottom: 0, trailing: 16)
	@Binding var isAuthorization: Int

	var body: some View {
		VStack {
			VStack(alignment: .leading, spacing: 12) {
				Text(L10n.infoTextNumberPhone)
					.font(Font.system(size: 20, weight: .bold ))

				Text(L10n.infoTextCode)
					.foregroundColor(Color(Asset.gray1.name))
					.font(.system(size: 16, weight: .regular))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(insetTextTitle)

			TextField(
				L10n.infoTextField,
				value: $loginData.firebaseAuth.phoneNumber,
				formatter: PhoneFormatter())
			.padding(.horizontal, 16)
			.frame(maxWidth: .infinity, maxHeight: 44)
			.foregroundColor(Color(Asset.gray1.name))
			.border(Color(Asset.gray1.name))
			.padding(insetTextField)
			
			if loginData.phonePromt() {
				Text(L10n.errorText)
					.frame(maxWidth: .infinity, alignment: .leading)
					.font(.system(size: 15, weight: .regular))
					.foregroundColor(Color(Asset.red.name))
					.padding(insetTextTitle)
			}

			NavigationLink(
				destination: CodeViewForEnterToProfile(
					registrationButton: $loginData.registrationButton,
					phoneNumber: loginData.firebaseAuth.phoneNumber,
					id: loginData.firebaseAuth.id,
					isAuthorization: $isAuthorization),
				isActive: $loginData.registrationButton
			) {
				Button {
					Task {
						try await loginData.checkPhoneNumber()
					}
				} label: {
					Text(L10n.textAuthorizationButton)
						.frame(maxWidth: .infinity, alignment: .center)
						.frame(height: 44)
						.font(.system(size: 16, weight: .bold))
						.foregroundColor(.white)
						.background(Color(Asset.blue2.name))
						.cornerRadius(8)
				}
			}
			.padding(insetButton)
		}
	}
}

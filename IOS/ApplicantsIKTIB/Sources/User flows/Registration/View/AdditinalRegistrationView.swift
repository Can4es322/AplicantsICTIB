import SwiftUI

struct AdditinalRegistrationView: View {
	@ObservedObject var viewData = ServerHandler()
	@ObservedObject var loginData = LoginViewModel()
	var token: String?
	@Binding var isAuthorization: Int
	
	let insetTextField = EdgeInsets(top: 42, leading: 16, bottom: 0, trailing: 16)
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				VStack {
					Text(L10n.additionalTitle1)
						.frame(maxWidth: .infinity, alignment: .leading)
						.font(.system(size: 25, weight: .bold))
					Text(L10n.additionalTitle2)
						.frame(maxWidth: .infinity, alignment: .leading)
						.font(.system(size: 25, weight: .bold))
				}
				.padding(.top)
				.padding(.leading, 24)
				
				TextFieldPersonData(
					placeHolderText: L10n.lastNameTextField,
					placeHolderBinding: $viewData.person.lastName,
					placeHolderFormatter: nil
				)
				.padding(.top, 20)
				
				TextFieldPersonData(
					placeHolderText: L10n.nameTextField,
					placeHolderBinding: $viewData.person.firstName,
					placeHolderFormatter: nil
				)
				.padding(.top, 20)
				
				TextFieldPersonData(
					placeHolderText: L10n.middleNameTextField,
					placeHolderBinding: $viewData.person.middleName,
					placeHolderFormatter: nil
				)
				.padding(.top, 20)
				
				TextFieldPersonData(
					placeHolderText: L10n.birthdayTextField,
					placeHolderBinding: $viewData.person.birthDate,
					placeHolderFormatter: BirthdayFormatter()
				)
				.padding(.top, 20)
				
				TextFieldPersonData(
					placeHolderText: L10n.cityTextField,
					placeHolderBinding: $viewData.person.city,
					placeHolderFormatter: nil
				)
				.padding(.top, 20)
				
				TextFieldPersonData(
					placeHolderText: L10n.schoolTextField,
					placeHolderBinding: $viewData.person.school,
					placeHolderFormatter: nil
				)
				.padding(.top, 20)
				
				NavigationLink(
					destination: SuccesRegistration(isAuthorization: $isAuthorization),
					isActive: $viewData.isSuccesReg
				) {
					Button {
						Task {
							try await viewData.sendDataRegistration(idToken: token)
						}
					} label: {
						Text(L10n.additionalTextButton)
							.frame(maxWidth: .infinity, alignment: .center)
							.frame(height: 44)
							.font(.system(size: 16, weight: .bold))
							.foregroundColor(.white)
							.background(
								viewData.checkPersonData() ? Color(Asset.gray2.name) : Color(Asset.blue2.name))
							.cornerRadius(8)
					}
					.disabled(viewData.checkPersonData())
					.padding(insetTextField)
				}
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: BackButton())
	}
}

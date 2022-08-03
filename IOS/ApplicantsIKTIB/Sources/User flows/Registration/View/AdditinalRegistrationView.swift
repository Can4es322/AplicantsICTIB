import SwiftUI

struct AdditinalRegistrationView: View {

    @StateObject var viewData = ViewController()
    @ObservedObject var loginData = LoginViewModel()
    var token: String?

    let insetTextField = EdgeInsets(top: 42, leading: 16, bottom: 0, trailing: 16)

    var body: some View {
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
                    placeHolderBinding: $viewData.person.name,
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
                    placeHolderBinding: $viewData.person.birthday,
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
                    destination: SuccesRegistration(),
                    isActive: $viewData.isSuccesReg
                ) {
                    Button {
                        viewData.sendData(idToken: token)
                    } label: {
                        Text(L10n.additionalTextButton)
                            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .background(
                                        viewData.checkPersonData() ?
                                        Color(Asset.gray2.name) :
                                        Color(Asset.blue2.name))
                            .cornerRadius(8)
                    }
                    .disabled(viewData.checkPersonData())
                    .padding(insetTextField)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
    }
}

struct AdditinalRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        AdditinalRegistrationView()
    }
}

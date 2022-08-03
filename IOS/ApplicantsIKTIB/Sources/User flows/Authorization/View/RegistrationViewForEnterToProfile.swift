import SwiftUI

struct RegistrationViewForEnterToProfile: View {
    @ObservedObject var loginData = LoginViewModel()
    @Environment (\.dismiss) var dismiss

    let insetTextTitle = EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16)
    let insetTextField = EdgeInsets(top: 91, leading: 16, bottom: 0, trailing: 16)
    let insetButton = EdgeInsets(top: 71, leading: 16, bottom: 0, trailing: 16)

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
                    phoneNumber: loginData.firebaseAuth.phoneNumber,
                    id: loginData.firebaseAuth.id),
                isActive: $loginData.registrationButton
            ) {
                Button {
                    Task {
                         try await loginData.checkPhoneNumber()
                    }
                } label: {
                    Text(L10n.textAuthorizationButton)
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

struct RegistrationViewForEnterToProfile_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationViewForEnterToProfile()
    }
}

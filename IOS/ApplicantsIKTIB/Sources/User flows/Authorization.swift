import SwiftUI

struct Authorization: View {
  @Binding var isAuthorization: Bool

    var body: some View {
        NavigationView {
            VStack {
                Text(L10n.authorizationTitle)
                    .font(.system(size: 34, weight: .bold))
                    .padding(.top, 20)

                Image(Asset.authorization.name)
                    .padding(.top, 60)

                VStack(alignment: .center, spacing: 20) {
                    NavigationLink(destination: RegistrationViewForEnterToProfile() ) {
                        TextButton(placeHolderText: L10n.authorizationTextButton)
                            .foregroundColor(.white)
                            .background(Color(Asset.blue2.name))
                    }
                    .padding(.horizontal, 16)

                    NavigationLink(destination: RegistrationView() ) {
                        TextButton(placeHolderText: L10n.registrationTextButton)
                            .foregroundColor(.black)
                            .background(Color(Asset.gray4.name))
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.top, 70)

               Divider()
                    .padding(.top, 20)
                    .padding(.horizontal, 16)

              TextButton(placeHolderText: L10n.enterGuest)
                  .foregroundColor(.black)
                  .background(Color(Asset.gray4.name))
                  .padding(.horizontal, 16)
                  .padding(.top, 20)
                  .onTapGesture {
                    isAuthorization = true
                  }

//                NavigationLink(destination: MainEventsView() ) {
//                    TextButton(placeHolderText: L10n.enterGuest)
//                        .foregroundColor(.black)
//                        .background(Color(Asset.gray4.name))
//                }
//                .padding(.horizontal, 16)
//                .padding(.top, 20)

                Text(L10n.politicalInfo)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(Color(Asset.gray1.name))
                    .padding(20)

                Spacer()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

//struct Authorization_Previews: PreviewProvider {
//    static var previews: some View {
//        Authorization(isAuthorization: false)
//    }
//}

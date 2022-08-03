import SwiftUI

struct SuccesRegistration: View {
    @State var button = false

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

            NavigationLink(destination: MainView(), isActive: $button) {
                Button {
                    button = true
                } label: {
                    Text(L10n.succesRegistrationButton)
                        .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .background(Color(Asset.blue2.name))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 70)

        }
    }
}

struct SuccesRegistration_Previews: PreviewProvider {
    static var previews: some View {
        SuccesRegistration()
    }
}

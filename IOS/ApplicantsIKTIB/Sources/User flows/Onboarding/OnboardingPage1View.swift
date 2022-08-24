import SwiftUI

struct OnboardingPage1View: View {
  @Binding var isAuthorization: Int
  @Binding var firstEntry: Bool

  var body: some View {
    NavigationView {
      VStack(alignment: .leading, spacing: 0) {
        VStack(alignment: .leading) {
          Text(L10n.universityIKTIB)
            .font(.system(size: 64, weight: .semibold))
            .foregroundColor(Color(Asset.blue1.name))
          Text(L10n.university)
            .font(.system(size: 64, weight: .semibold))
            .foregroundColor(Color(Asset.blue1.name))

          Text(L10n.fullNameUniversity)
            .foregroundColor(Color(Asset.blue1.name))
            .font(.system(size: 24, weight: .regular))
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.top, 73)

        Image(Asset.house.name)
          .frame(maxWidth: .infinity)

        NavigationLink(destination: OnboardingPage2View(isAuthorization: $isAuthorization, firstEntry: $firstEntry)) {
          Text(L10n.authorizationTextButton)
            .font(.system(size: 20, weight: .regular))
            .foregroundColor(.white)
            .frame(width: 194, height: 44)
            .background(Color(Asset.blue3.name))
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.horizontal, 10)
        .padding(.top, 20)

        Spacer()

        HStack(spacing: 10) {
          RoundedRectangle(cornerRadius: 4)
            .frame(width: 60, height: 12)
            .foregroundColor(Color(Asset.blue3.name))
          RoundedRectangle(cornerRadius: 4)
            .frame(width: 35, height: 12)
            .foregroundColor(.white)
          RoundedRectangle(cornerRadius: 4)
            .frame(width: 35, height: 12)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .offset(y: -26)
      }
      .frame(maxHeight: .infinity)
      .background(Color(Asset.blue4.name))
      .ignoresSafeArea()
      .navigationBarTitle("")
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
    }
  }
}

struct OnboardingPage1View_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingPage1View(isAuthorization: .constant(1), firstEntry: .constant(true))
  }
}

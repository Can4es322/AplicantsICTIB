import SwiftUI

struct OnboardingPage3View: View {
  @Binding var isAuthorization: Int
  @Binding var firstEntry: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(L10n.taskDescription)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 28, weight: .semibold))
        .foregroundColor(Color(Asset.blue1.name))
        .padding(.horizontal, 10)
        .padding(.top, 90)

      Rectangle()
        .frame(maxWidth: .infinity, maxHeight: 238)
        .foregroundColor(.blue)
        .padding(.top, 47)

      Text(L10n.bonusesDescription)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 28, weight: .semibold))
        .foregroundColor(Color(Asset.blue1.name))
        .padding(.horizontal, 10)
        .padding(.top, 83)


      Text(L10n.clear)
          .font(.system(size: 20, weight: .regular))
          .foregroundColor(.white)
          .frame(width: 194, height: 44)
          .background(Color(Asset.blue3.name))
          .cornerRadius(10)
          .frame(maxWidth: .infinity, alignment: .trailing)
          .padding(.horizontal, 10)
          .padding(.top, 20)
          .onTapGesture {
            isAuthorization = 1
            firstEntry = false
          }

      Spacer()

      HStack(spacing: 10) {
        RoundedRectangle(cornerRadius: 4)
          .frame(width: 35, height: 12)
          .foregroundColor(.white)
        RoundedRectangle(cornerRadius: 4)
          .frame(width: 35, height: 12)
          .foregroundColor(.white)
        RoundedRectangle(cornerRadius: 4)
          .frame(width: 60, height: 12)
          .foregroundColor(Color(Asset.blue3.name))
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

struct OnboardingPage3View_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingPage3View(isAuthorization: .constant(1), firstEntry: .constant(true))
  }
}

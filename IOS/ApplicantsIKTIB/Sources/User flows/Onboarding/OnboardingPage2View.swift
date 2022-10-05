import SwiftUI

struct OnboardingPage2View: View {
	@Binding var isAuthorization: Int
	@Binding var firstEntry: Bool
	
	var body: some View {
		VStack(alignment: .leading, spacing: 0) {
			Spacer()
			Image(Asset.books.name)
				.resizable()
				.scaledToFit()
				.frame(maxWidth: .infinity, alignment: .center)
				.padding(.top, 40)
			
			Text(L10n.onboardingDescription)
				.frame(height: 120)
				.foregroundColor(Color(Asset.blue1.name))
				.font(.system(size: 20, weight: .semibold))
				.scaledToFit()
				.padding(.top, 10)
				.padding(.leading, 16)
			
			Spacer()
			
			NavigationLink(destination: OnboardingPage3View(isAuthorization: $isAuthorization, firstEntry: $firstEntry)) {
				Text(L10n.textAuthorizationButton)
					.font(.system(size: 20, weight: .regular))
					.foregroundColor(.white)
					.scaledToFit()
					.frame(maxWidth: 194, maxHeight: 44)
					.background(Color(Asset.blue3.name))
					.cornerRadius(10)
					.padding(.horizontal, 10)
			}
			.frame(maxWidth: .infinity, alignment: .trailing)
			.padding(.bottom, 20)
			
			Spacer()
			
			HStack(spacing: 10) {
				RoundedRectangle(cornerRadius: 4)
					.frame(width: 35, height: 12)
					.foregroundColor(.white)
				RoundedRectangle(cornerRadius: 4)
					.frame(width: 60, height: 12)
					.foregroundColor(Color(Asset.blue3.name))
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

struct OnboardingPage2View_Previews: PreviewProvider {
	static var previews: some View {
		OnboardingPage2View(isAuthorization: .constant(1), firstEntry: .constant(true))
	}
}

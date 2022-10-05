import SwiftUI

struct SplashScreen: View {
	@State var sizeContent = -621
	@State var isActive = false
	
	var body: some View {
		if isActive {
			StartView()
		} else {
			ZStack {
				Color(Asset.bg.name)
					.ignoresSafeArea()
				Spacer()
				VStack(spacing: 0) {
					Image(Asset.splashInstitute.name)
						.frame(maxWidth: .infinity, alignment: .center)
						.offset(x: CGFloat(sizeContent))
						.padding(.top, 118)
						.onAppear {
							withAnimation(.easeInOut(duration: 1)) {
								self.sizeContent = 0
							}
						}
					Spacer()
					Image(Asset.splashScreen.name)
						.frame(maxWidth: .infinity, alignment: .leading)
						.offset(x: CGFloat(sizeContent))
						.onAppear {
							withAnimation(.easeInOut(duration: 1)) {
								self.sizeContent = 0
							}
						}
				}
				Spacer()
			}
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					withAnimation {
						isActive = true
					}
				}
			}
		}
	}
}

struct SplashScreen_Previews: PreviewProvider {
	static var previews: some View {
		SplashScreen()
	}
}

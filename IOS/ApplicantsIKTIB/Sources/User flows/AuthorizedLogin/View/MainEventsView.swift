import SwiftUI

struct MainEventsView: View {
	@ObservedObject var loginData = LoginViewModel()
	@Binding var isAuthorization: Int
	var body: some View {
		NavigationView {
			ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
				TabView(selection: $loginData.selectedTab) {
					SelectorView(selectedIndex: $loginData.tempIndex, isAuthorization: $isAuthorization)
						.tag(0)
					
					ShopView()
						.tag(1)
					
					ProfileView(isAuthorization: $isAuthorization)
						.tag(2)
				}
				
				HStack(spacing: 0) {
					Spacer()
					
					Button {
						loginData.selectedTab = 0
					} label: {
						VStack(spacing: 2) {
							Image(Asset.tabEvent.name)
								.renderingMode(.template)
							Text(L10n.eventsTab)
								.font(.system(size: 10, weight: .regular))
						}
						.foregroundColor(loginData.selectedTab == 0 ?
										 Color(Asset.blue1.name) :
											Color(Asset.gray1.name))
					}
					
					Spacer()
					Button {
						loginData.selectedTab = 1
					} label: {
						VStack(spacing: 2) {
							Image(Asset.shop.name)
								.renderingMode(.template)
							Text(L10n.tabBarShop)
								.font(.system(size: 10, weight: .regular))
						}
						.foregroundColor(loginData.selectedTab == 1 ?
										 Color(Asset.blue1.name) :
											Color(Asset.gray1.name))
					}
					Spacer()
					
					Button {
						loginData.selectedTab = 2
					} label: {
						VStack(spacing: 2) {
							Image(Asset.tabProfile.name)
								.renderingMode(.template)
							Text(L10n.profileTab)
								.font(.system(size: 10, weight: .regular))
						}
						.foregroundColor(loginData.selectedTab == 2 ?
										 Color(Asset.blue1.name) :
											Color(Asset.gray1.name))
					}
					Spacer()
				}
				.task {
					loginData.isSuccessEnter = true
				}
				.frame(maxWidth: .infinity, maxHeight: 55)
				.background(.white)
				.cornerRadius(10)
				.padding(.horizontal, 7)
				.shadow(color: Color(Asset.black2.name), radius: 20, x: 0, y: 4)
			}
		}
	}
}

struct MainEventsView_Previews: PreviewProvider {
	static var previews: some View {
		MainEventsView(isAuthorization: .constant(1))
	}
}

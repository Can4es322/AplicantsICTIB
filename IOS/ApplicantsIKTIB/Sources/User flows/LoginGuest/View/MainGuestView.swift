import SwiftUI

struct MainGuestView: View {
  @ObservedObject var loginData = LoginViewModel()

  @Binding var isAuthorization: Int

  var body: some View {
    NavigationView {
      ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
        TabView(selection: $loginData.selectedTab) {
          VStack {
            Text(L10n.eventsTitle)
              .font(.system(size: 25, weight: .bold))
              .padding([.bottom, .top], 13)

            EventsView(isAuthorization: $isAuthorization)
          }
          .tag(0)

          UniversityView()
            .tag(1)
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
          Spacer()

          Button {
            loginData.selectedTab = 1
          } label: {
            VStack(spacing: 2) {
              Image(Asset.university.name)
                .renderingMode(.template)
              Text(L10n.instituteTab)
                .font(.system(size: 10, weight: .regular))
            }
            .foregroundColor(loginData.selectedTab == 1 ?
                             Color(Asset.blue1.name) :
                              Color(Asset.gray1.name))
          }
          Spacer()
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

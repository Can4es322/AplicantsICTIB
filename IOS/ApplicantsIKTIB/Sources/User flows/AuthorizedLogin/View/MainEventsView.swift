import SwiftUI

struct MainEventsView: View {
  @ObservedObject var loginData = LoginViewModel()
  @State var selectedTab = 0
  @State var tempIndex = 0
  @Binding var isAuthorization: Int
  var tabs = ["События", "Профиль"]

  var body: some View {
    NavigationView {
      ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
        TabView(selection: $selectedTab) {
          
          SelectorView(selectedIndex: $tempIndex, isAuthorization: $isAuthorization)
            .tag(0)

          ProfileView(isAuthorization: $isAuthorization)
            .tag(1)
        }

        HStack(spacing: 0) {
          Spacer()

          Button {
            selectedTab = 0
          } label: {
            VStack(spacing: 2) {
              Image(Asset.tabEvent.name)
                .renderingMode(.template)
              Text("События")
                .font(.system(size: 10, weight: .regular))
            }
            .foregroundColor(selectedTab == 0 ?
                               Color(Asset.blue1.name) :
                                      Color(Asset.gray1.name))
          }

          Spacer()
          Spacer()

          Button {
            selectedTab = 1
          } label: {
            VStack(spacing: 2) {
              Image(Asset.tabProfile.name)
                .renderingMode(.template)
              Text("Профиль")
                .font(.system(size: 10, weight: .regular))
            }
            .foregroundColor(selectedTab == 1 ?
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
    StartView()
  }
}

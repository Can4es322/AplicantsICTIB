import SwiftUI

struct MainEventsView: View {

  private enum Tab: Hashable {
      case events
      case profile
  }

  @State private var selectedTab: Tab = .events

  var body: some View {
    TabView(selection: $selectedTab) {
        SelectorView()
            .tag(0)
            .tabItem {
              VStack {
                Image(Asset.tabEvent.name)
                  .renderingMode(.template)
                Text("События")
                }
              }

        ProfileView()
            .tag(1)
            .tabItem {
              Image(Asset.tabProfile.name)
                .renderingMode(.template)
              Text("Профиль")
            }
    }
    .accentColor(Color(Asset.blue1.name))
  }
}

struct MainEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MainEventsView()
    }
}

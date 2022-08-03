import SwiftUI

struct SelectorView: View {
  @State var tempIndex = 0
  var body: some View {
    NavigationView {
      VStack {
        TabSelector(selectedIndex: $tempIndex)
        if tempIndex == 0 {
          EventsView()
        } else {
          RecordedEventsView()
        }
      }
      .navigationBarTitle("")
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
    }
  }
}

struct SelectorView_Previews: PreviewProvider {
  static var previews: some View {
    SelectorView()
  }
}

import SwiftUI

struct SelectorView: View {
  @Binding var selectedIndex: Int
  @Binding var isAuthorization: Int

  var body: some View {
    VStack {
      TabSelector(selectedIndex: $selectedIndex)
      if selectedIndex == 0 {
        EventsView(isAuthorization: $isAuthorization)
      } else {
        RecordedEventsView(isAuthorization: $isAuthorization)
      }
    }
  }
}

struct SelectorView_Previews: PreviewProvider {
  static var previews: some View {
    SelectorView(selectedIndex: .constant(1), isAuthorization: .constant(1))
  }
}

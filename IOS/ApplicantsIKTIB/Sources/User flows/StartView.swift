import SwiftUI

struct StartView: View {
  @State var isAuthorization = false

    var body: some View {
      if isAuthorization {
        MainEventsView()
      } else {
        Authorization(isAuthorization: $isAuthorization)
      }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

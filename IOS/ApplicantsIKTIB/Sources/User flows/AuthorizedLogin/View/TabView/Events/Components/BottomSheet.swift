import SwiftUI

struct BottomSheet: View {
  @Binding var isShowing: Bool
  var body: some View {
    VStack {

    }
  }
}


struct BottomSheet_Previews: PreviewProvider {
  static var previews: some View {
    BottomSheet(isShowing: .constant(true))
  }
}



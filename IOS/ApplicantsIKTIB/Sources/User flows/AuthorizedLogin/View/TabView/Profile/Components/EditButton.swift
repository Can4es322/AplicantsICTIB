import SwiftUI

struct EditButton: View {
  @Binding var isEdit: Bool
  
  var body: some View {
    Button {
      isEdit = false
    } label: {
      Image(Asset.edit.name)
    }
    .opacity(isEdit ? 1 : 0)
  }
}

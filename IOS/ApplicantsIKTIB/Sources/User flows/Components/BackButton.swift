import SwiftUI

struct BackButton: View {
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack {
            Button {
                self.dismiss()
            } label: {
                Image(Asset.back.name)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}

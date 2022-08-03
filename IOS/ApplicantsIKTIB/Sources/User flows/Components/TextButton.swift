import SwiftUI

struct TextButton: View {
    var placeHolderText: String

    var body: some View {
        Text(placeHolderText)
            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
            .font(.system(size: 16, weight: .bold))
            .cornerRadius(4)
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton(placeHolderText: "Authorization")
    }
}

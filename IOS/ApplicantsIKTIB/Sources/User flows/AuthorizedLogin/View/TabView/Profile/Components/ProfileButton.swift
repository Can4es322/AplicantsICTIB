import SwiftUI

struct ProfileButton: View {
  var placeHolderImage: String
  var placeHolderText: String

  var body: some View {
    HStack(spacing: 8) {
      Image(placeHolderImage)
        .frame(width: 40, height: 40)
        .background(Color(Asset.gray5.name))
        .cornerRadius(8)

      Text(placeHolderText)
        .font(.system(size: 15, weight: .regular))
        .foregroundColor(.black)
    }
    .padding(.leading, 10)
  }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
      ProfileButton(placeHolderImage: Asset.person.name, placeHolderText: "Персональные данные")
    }
}

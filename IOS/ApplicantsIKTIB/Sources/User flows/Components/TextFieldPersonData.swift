import SwiftUI

struct TextFieldPersonData: View {
    var placeHolderText: String
    var placeHolderBinding: Binding<String>
    var placeHolderFormatter: Formatter?

    var body: some View {
        VStack {
            Text(placeHolderText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(Color(Asset.black1.name))

            if placeHolderFormatter != nil {
                TextField(
                    "",
                    value: placeHolderBinding,
                    formatter: BirthdayFormatter()
                )
                .foregroundColor(Color(Asset.gray3.name))
                .frame(maxWidth: .infinity)
            } else {
                TextField("", text: placeHolderBinding)
                    .foregroundColor(Color(Asset.gray3.name))
                    .frame(maxWidth: .infinity)
            }

            Divider()
                .frame(height: 1)
                .background(Color(Asset.gray1.name))
        }
        .padding(.horizontal, 15)
    }
}

import SwiftUI

struct NewsEvent: View {
  var placeHolderNewsData: New

  var body: some View {
    NavigationLink(destination: NewsPostView(placeHolderNewsData: placeHolderNewsData)) {
      VStack(spacing: 5) {
        AsyncImage(url: URL(string: placeHolderNewsData.image)) { image in
          image
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: 170, alignment: .center)
            .cornerRadius(8)
        }placeholder: {
          ProgressView()
            .frame(maxWidth: .infinity, maxHeight: 170, alignment: .center)
        }

        Text(placeHolderNewsData.title)
          .font(.system(size: 14, weight: .regular))
          .frame(maxWidth: .infinity, alignment: .leading)
          .foregroundColor(.black)
          .multilineTextAlignment(.leading)
          .lineSpacing(8)

      }
      .padding([.vertical, .horizontal], 5)
      .frame(maxWidth: .infinity)
      .background(.white)
      .cornerRadius(8)
    }
  }
}

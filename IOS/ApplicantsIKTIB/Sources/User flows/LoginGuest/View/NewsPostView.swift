import SwiftUI

struct NewsPostView: View {
  var placeHolderNewsData: New
  @ObservedObject var newsData = EventsViewModel()
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .leading) {
          AsyncImage(url: URL(string: placeHolderNewsData.image)) { image in
            image
              .resizable()
              .scaledToFill()
              .frame(maxWidth: .infinity, maxHeight: 286, alignment: .center)
              .cornerRadius(10)
          }placeholder: {
            ProgressView()
              .frame(maxWidth: .infinity, maxHeight: 286, alignment: .center)
          }

          HStack(spacing: 7) {
            Image(Asset.date.name)
              .renderingMode(.template)
              .foregroundColor(.blue)

            Text(newsData.createdAt ?? "")
              .font(.system(size: 12, weight: .regular))
              .foregroundColor(Color(Asset.gray1.name))
          }
          .padding(.bottom, 15)

          Text(placeHolderNewsData.subTitle)
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.black)
            .padding(.bottom, 15)

          Text(placeHolderNewsData.description)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.black)
            .lineSpacing(6)
        }
      }
      .task {
        newsData.dateBuildingNews(startDate: placeHolderNewsData.createdAt)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 15)
      .navigationTitle(placeHolderNewsData.title)
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(leading: BackButton())
    }
}

import SwiftUI

struct UpcomingEvents: View {
  var placeHolderImage: URL
  var placeHolderTitle: String
  var placeHolderDate: String
  var placeHolderPlace: String
  var placeHolderTag: String
  var placeHolderMoney: Int

  var body: some View {
    VStack {
      NavigationLink(destination: EventPostView(
        placeHolderImage: placeHolderImage,
        placeHolderTitle: placeHolderTitle,
        placeHolderDate: placeHolderDate,
        placeHolderPlace: placeHolderPlace,
        placeHolderTag: placeHolderTag,
        placeHolderMoney: placeHolderMoney)) {
          ZStack(alignment: .bottom) {
              AsyncImage(url: placeHolderImage) { image in
                  image
                      .resizable()
                      .scaledToFill()
                      .frame(maxWidth: 250, maxHeight: 325, alignment: .center)
                      .cornerRadius(10)

              }placeholder: {
                  ProgressView()
                      .frame(maxWidth: 250, maxHeight: 325, alignment: .center)
              }

              VStack(alignment: .leading, spacing: 4) {
                  Text(placeHolderTitle)
                  .foregroundColor(Color(.black))
                    .font(.system(size: 16, weight: .bold))

                  Text(placeHolderDate)
                    .foregroundColor(Color(Asset.gray1.name))
                    .font(.system(size: 12, weight: .regular))

                HStack(spacing: 3) {
                  Image(Asset.map.name)
                  Text(placeHolderPlace)
                    .foregroundColor(Color(Asset.gray1.name))
                    .font(.system(size: 12, weight: .regular))
                }
                .padding(.bottom, 10)

                EventTag(placeHolderTag: placeHolderTag, placeHolderMoney: placeHolderMoney)
              }
              .padding(.leading, 6)
              .multilineTextAlignment(.leading)
              .frame(maxWidth: 234, maxHeight: 124, alignment: .leading)
              .background(
                  Rectangle()
                      .foregroundColor(.white)
                      .cornerRadius(10)
              )
              .padding([.bottom, .leading, .trailing], 8)

          }
      }
    }
  }
}

struct UpcomingEvents_Previews: PreviewProvider {
    static var previews: some View {
      UpcomingEvents(
        placeHolderImage: URL(string: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg")!,
        placeHolderTitle: "Выпускной ИКТИБ",
        placeHolderDate: "Ср, 22 июня · 12:00 – 15:00",
        placeHolderPlace: "Клуб «Студенческий», Чехова 76",
        placeHolderTag: "Встреча",
        placeHolderMoney: 2)
    }
}

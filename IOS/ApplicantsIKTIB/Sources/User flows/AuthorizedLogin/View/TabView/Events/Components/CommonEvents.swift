import SwiftUI

struct CommonEvents: View {
  var placeHolderImage: URL
  var placeHolderTitle: String
  var placeHolderDate: String
  var placeHolderPlace: String
  var placeHolderTag: String
  var placeHolderMoney: Int

  
    var body: some View {
      NavigationLink(destination: EventPostView(
      placeHolderImage: placeHolderImage,
      placeHolderTitle: placeHolderTitle,
      placeHolderDate: placeHolderDate,
      placeHolderPlace: placeHolderPlace,
      placeHolderTag: placeHolderTag,
      placeHolderMoney: placeHolderMoney)) {
        HStack(spacing: 10) {
                  AsyncImage(url: placeHolderImage) { image in
                      image
                          .resizable()
                          .scaledToFill()
                          .frame(maxWidth: 98, maxHeight: 92, alignment: .leading)
                          .cornerRadius(4)
                  }placeholder: {
                      ProgressView()
                          .frame(maxWidth: 98, maxHeight: 92)
                  }

                VStack(alignment: .leading, spacing: 3) {
                    Text(placeHolderDate)
                      .font(.system(size: 12, weight: .regular))
                      .foregroundColor(.black)

                    Text(placeHolderTitle)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)

                    HStack(spacing: 3) {
                      Image(Asset.map.name)
                        .renderingMode(.template)
                        .foregroundColor(.black)
                      Text(placeHolderPlace)
                        .foregroundColor(.black)
                        .font(.system(size: 12, weight: .regular))
                    }

                    EventTag(placeHolderTag: placeHolderTag, placeHolderMoney: placeHolderMoney)
                  }
              }
              .frame(maxWidth: .infinity, maxHeight: 92, alignment: .leading)
          }
    }
}

struct CommonEvents_Previews: PreviewProvider {
    static var previews: some View {
        CommonEvents(
          placeHolderImage: URL(string: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg")!,
          placeHolderTitle: "Выпускной ИКТИБ",
          placeHolderDate: "Ср, 22 июня · 12:00 – 15:00",
          placeHolderPlace: "Клуб «Студенческий», Чехова 76",
          placeHolderTag: "Встреча",
          placeHolderMoney: 2)
    }
}

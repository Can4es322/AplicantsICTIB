import SwiftUI

struct EventPostView: View {
  var placeHolderImage: URL
  var placeHolderTitle: String
  var placeHolderDate: String
  var placeHolderPlace: String
  var placeHolderTag: String
  var placeHolderMoney: Int
  let insetContent = EdgeInsets(top: 15, leading: 16, bottom: 0, trailing: 0)

  var body: some View {
    VStack(alignment: .leading) {
      AsyncImage(url: placeHolderImage) { image in
          image
              .resizable()
              .scaledToFill()
              .frame(maxWidth: 335, maxHeight: 286, alignment: .center)
              .cornerRadius(10)
      }placeholder: {
          ProgressView()
              .frame(maxWidth: 335, maxHeight: 286)
      }
      .padding([.top, .bottom], 16)

      EventTag(placeHolderTag: placeHolderTag, placeHolderMoney: placeHolderMoney)
        .padding(.bottom, 12)

      Text(L10n.eventPostTitle)
        .font(.system(size: 14, weight: .regular))
        .foregroundColor(.black)
      
      HStack {
        Image(Asset.date.name)

        Text(placeHolderDate)
          .font(.system(size: 12, weight: .regular))
      }

      HStack {
        Image(Asset.time.name)

        Text(placeHolderDate)
          .font(.system(size: 12, weight: .regular))
      }

      HStack {
        Image(Asset.map.name)
          .renderingMode(.template)
          .foregroundColor(.black)

        Text(placeHolderPlace)
          .font(.system(size: 12, weight: .regular))
      }

      Text(L10n.eventsDescription)
        .font(.system(size: 14, weight: .regular))
        .foregroundColor(.black)
        .padding(.top, 15)

      Text("Хакатон — форум для разработчиков, во время которого специалисты из разных областей разработки программного обеспечения сообща решают какую-либо проблему на время.")
        .font(.system(size: 14, weight: .regular))
        .foregroundColor(.black)
        .padding(.top, 6)

      Button {

      }label: {
        Text(L10n.eventsButton)
          .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.white)
          .background(Color(Asset.blue2.name))
      }
      .padding(.top, 32)

      Spacer()
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.horizontal, 15)
    .navigationTitle(placeHolderTitle)
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading:
        BackButton()
    )
  }
}

struct EventPostView_Previews: PreviewProvider {
    static var previews: some View {
        EventPostView(
          placeHolderImage: URL(string: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg")!,
          placeHolderTitle: "Выпускной ИКТИБ",
          placeHolderDate: "Ср, 22 июня · 12:00 – 15:00",
          placeHolderPlace: "Клуб «Студенческий», Чехова 76",
          placeHolderTag: "Встреча",
          placeHolderMoney: 2)
    }
}

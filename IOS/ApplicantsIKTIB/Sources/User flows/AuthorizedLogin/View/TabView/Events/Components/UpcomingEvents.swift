import SwiftUI

struct UpcomingEvents: View {
  var placeHolderEventData: Event
  @StateObject var eventsData = EventsViewModel()
  @Binding var isAuthorization: Int

  var body: some View {
    VStack {
      NavigationLink(destination: EventPostView(placeHolderEventData: placeHolderEventData, isAuthorization: $isAuthorization)) {
          ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: placeHolderEventData.image)) { image in
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
              Text(placeHolderEventData.title)
                .foregroundColor(Color(.black))
                .font(.system(size: 16, weight: .bold))

              if eventsData.isLongDate {
                Text(eventsData.dayWeekStart ?? "Пн")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(", ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.dayStart ?? "Пн")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(" - ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.dayWeekEnd ?? "Пн")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(", ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.dayEnd ?? "Пн")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular))
              } else {
                Text(eventsData.dayWeekStart ?? "Пн")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(", ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.dayStart ?? "Пн")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(" ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.timeStart ?? "Пн")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(" - ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.timeEnd ?? "Пн")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular))
              }

              HStack(spacing: 3) {
                Image(Asset.map.name)
                Text(placeHolderEventData.shortAddress)
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular))

              }
              .padding(.bottom, 10)

              EventTag(placeHolderTag: placeHolderEventData.tags, placeHolderMoney: placeHolderEventData.bonuses)
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
      .task {
        eventsData.checkLongDate(startDate: placeHolderEventData.startDate, endDate: placeHolderEventData.endDate)
        eventsData.getDayOfWeek(startDate: placeHolderEventData.startDate, endDate: placeHolderEventData.endDate)
      }
    }
  }
}

//struct UpcomingEvents_Previews: PreviewProvider {
//    static var previews: some View {
//      UpcomingEvents(
//        placeHolderImage: URL(string: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg")!,
//        placeHolderTitle: "Выпускной ИКТИБ",
//        placeHolderDate: "Ср, 22 июня · 12:00 – 15:00",
//        placeHolderPlace: "Клуб «Студенческий», Чехова 76",
//        placeHolderTag: "Встреча",
//        placeHolderMoney: 2)
//    }
//}

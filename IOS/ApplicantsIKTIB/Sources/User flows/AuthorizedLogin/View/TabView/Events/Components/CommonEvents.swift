import SwiftUI

struct CommonEvents: View {
  var placeHolderEventData: Event
  @StateObject var eventsData = EventsViewModel()
  @Binding var isAuthorization: Int

  var body: some View {
    NavigationLink(destination: EventPostView(placeHolderEventData: placeHolderEventData, isAuthorization: $isAuthorization)) {
        HStack(spacing: 10) {
          AsyncImage(url: URL(string: placeHolderEventData.image)) { image in
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

            Text(placeHolderEventData.title)
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.black)

            HStack(spacing: 3) {
              Image(Asset.map.name)
                .renderingMode(.template)
                .foregroundColor(.black)
              Text(placeHolderEventData.shortAddress)
                .foregroundColor(.black)
                .font(.system(size: 12, weight: .regular))
            }

            EventTag(placeHolderTag: placeHolderEventData.tags, placeHolderMoney: placeHolderEventData.bonuses)
          }
        }
        .task {
          eventsData.checkLongDate(startDate: placeHolderEventData.startDate, endDate: placeHolderEventData.endDate)
          eventsData.getDayOfWeek(startDate: placeHolderEventData.startDate, endDate: placeHolderEventData.endDate)
        }
        .frame(maxWidth: .infinity, maxHeight: 92, alignment: .leading)
      }

  }
}

//struct CommonEvents_Previews: PreviewProvider {
//    static var previews: some View {
//        CommonEvents(
//          placeHolderImage: URL(string: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg")!,
//          placeHolderTitle: "Выпускной ИКТИБ",
//          placeHolderDate: "Ср, 22 июня · 12:00 – 15:00",
//          placeHolderPlace: "Клуб «Студенческий», Чехова 76",
//          placeHolderTag: "Встреча",
//          placeHolderMoney: 2)
//    }
//}

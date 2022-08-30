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
                Text(eventsData.dayWeekStart ?? L10n.testDay)
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(", ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.dayStart ?? L10n.testDay)
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(" - ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.dayWeekEnd ?? L10n.testDay)
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(", ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.dayEnd ?? L10n.testDay)
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular))
              } else {
                Text(eventsData.dayWeekStart ?? L10n.testDay)
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(", ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.dayStart ?? L10n.testDay)
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(" ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.timeStart ?? L10n.testDay)
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(" - ")
                  .foregroundColor(Color(Asset.gray1.name))
                  .font(.system(size: 12, weight: .regular)) +
                Text(eventsData.timeEnd ?? L10n.testDay)
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

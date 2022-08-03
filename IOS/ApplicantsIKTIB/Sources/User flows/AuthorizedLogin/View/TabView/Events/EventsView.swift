import SwiftUI

struct EventsView: View {

  let insetText = EdgeInsets(top: 14, leading: 13, bottom: 0, trailing: 13)
  @ObservedObject var eventsData = EventsViewModel()
  var body: some View {
      VStack {
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(upcomingEvents) {post in
                  UpcomingEvents(
                    placeHolderImage: URL(string: post.image)!,
                    placeHolderTitle: post.title,
                    placeHolderDate: post.date ,
                    placeHolderPlace: post.place,
                    placeHolderTag: post.tag,
                    placeHolderMoney: post.money)
                }
              }
            }

            ForEach(commonEvents) {post in
              CommonEvents(
                placeHolderImage: URL(string: post.image)!,
                placeHolderTitle: post.title,
                placeHolderDate: post.date,
                placeHolderPlace: post.place,
                placeHolderTag: post.tag,
                placeHolderMoney: post.money)
            }
          }
          .padding(.leading, 13)
        }

        Spacer()
      }
      .padding(.top, 15)
    }
}

struct Events_Previews: PreviewProvider {
  static var previews: some View {
    EventsView()
  }
}

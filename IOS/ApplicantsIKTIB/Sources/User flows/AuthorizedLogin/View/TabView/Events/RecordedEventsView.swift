import SwiftUI

struct RecordedEventsView: View {
    var body: some View {
      VStack {
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
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
      }
    }
}

struct RecordedEvents_Previews: PreviewProvider {
    static var previews: some View {
        RecordedEventsView()
    }
}

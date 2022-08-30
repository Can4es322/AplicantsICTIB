import SwiftUI

struct ProfileEventsEttendView: View {
  @ObservedObject var server = ServerHandler()
  @Binding var isAuthorization: Int

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        ForEach(server.visitedEvents?.data ?? visitedEvent) {post in
          CommonEvents(placeHolderEventData: post, isAuthorization: $isAuthorization)
        }
      }
      .padding(.leading, 13)
    }
    .task {
      Task {
        try await server.sendVisitedEvents()
      }
    }
    .navigationTitle(L10n.eventsVisited)
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: BackButton())
  }
}

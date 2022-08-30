import SwiftUI

struct RecordedEventsView: View {
  @ObservedObject var server = ServerHandler()
  @Binding var isAuthorization: Int

  var body: some View {
    VStack {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          ForEach(server.recordedEvents?.data ?? recordedEvent) {post in
            CommonEvents(placeHolderEventData: post, isAuthorization: $isAuthorization)
          }
        }
        .padding(.leading, 13)
      }
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    .task {
      Task {
        try await server.sendRecordedEvents()
      }
    }
  }
}

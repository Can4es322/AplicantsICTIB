import SwiftUI

struct ProfileEventsEttendView: View {
  @ObservedObject var server = ViewController()
  @Binding var isAuthorization: Int

  var body: some View {
    VStack {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          ForEach(server.visitedEvents?.data ?? visitedEvent) {post in
            CommonEvents(placeHolderEventData: post, isAuthorization: $isAuthorization)
          }
        }
        .padding(.leading, 13)
      }
    }
    .task {
      Task {
        try await server.sendVisitedEvents()
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(content: {
      ToolbarItem(placement: .navigationBarLeading) {
        BackButton()
      }

      ToolbarItem(placement: .principal) {
        VStack {
          Text("Посещенные мероприятия")
            .font(.system(size: 20, weight: .bold))
        }
      }
    })
  }
}

//struct ProfileEventsEttendView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEventsEttendView()
//    }
//}

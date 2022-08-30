import SwiftUI

struct EventsView: View {

  let insetText = EdgeInsets(top: 14, leading: 13, bottom: 0, trailing: 13)
  @StateObject var viewData = ServerHandler()
  @Binding var isAuthorization: Int

  var body: some View {
      VStack {
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(viewData.events?.data ?? event) {post in
                  UpcomingEvents(placeHolderEventData: post, isAuthorization: $isAuthorization)
                }

                GeometryReader { reader -> Color in

                  let minX = reader.frame(in: .global).minX

                  let width = UIScreen.main.bounds.width / 15

                  if viewData.events?.meta.hasNextPage == true && minX < width {
                    DispatchQueue.main.async {
                      Task {
                        try await viewData.loadMoreContentEvents()
                      }
                    }
                  }
                  return Color.clear
                }
                .frame(width: 20, height: 20)
              }
            }
            .frame(maxHeight: 325)

            ForEach(viewData.events?.data ?? event) {post in
              CommonEvents(placeHolderEventData: post, isAuthorization: $isAuthorization)
            }

            GeometryReader { reader -> Color in

              let minY = reader.frame(in: .global).minY

              let height = UIScreen.main.bounds.height / 1.5

              if viewData.events?.meta.hasNextPage == true && minY < height {
                DispatchQueue.main.async {
                  Task {
                    try await viewData.loadMoreContentEvents()
                  }
                }
              }
              return Color.clear
            }
            .frame(width: 20, height: 20)
          }
          .padding(.leading, 13)
        }

        Spacer()
      }
      .navigationBarTitle("")
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
      .task {
        Task {
          try await viewData.sendEvents(numberTake: 3)
        }
      }
      .padding(.top, 15)
    }
}

struct Events_Previews: PreviewProvider {
  static var previews: some View {
    EventsView(isAuthorization: .constant(1))
  }
}

import SwiftUI

struct UniversityView: View {
  @ObservedObject var server = ServerHandler()

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        Text(L10n.aboutUniversite)
          .font(.system(size: 25, weight: .bold))
          .foregroundColor(.black)
          .padding(.bottom, 32)
          .padding(.top, 15)

        ForEach(server.newsEvent.data) {post in
          NewsEvent(placeHolderNewsData: post)
        }

        GeometryReader { reader -> Color in

          let minY = reader.frame(in: .global).minY

          let height = UIScreen.main.bounds.height / 1.5

          if server.newsEvent.meta.hasNextPage == true && minY < height {
            DispatchQueue.main.async {
              Task {
                try await server.loadMoreContentNews()
              }
            }
          }
          return Color.clear
        }
        .frame(width: 20, height: 20)
      }
    }
    .padding(.horizontal, 15)
    .background(Color(Asset.white.name))
    .task {
      Task {
        try await server.sendNews(numberTake: 5)
      }
    }
    .navigationTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}

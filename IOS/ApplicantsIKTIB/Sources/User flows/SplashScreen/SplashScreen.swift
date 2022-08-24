import SwiftUI

struct SplashScreen: View {
  @State var xx = -621
  @State var isActive = false

  var body: some View {
    if isActive {
      StartView()
    } else {
      ZStack(alignment: .leading) {
        Color(Asset.bg.name)
          .ignoresSafeArea()


        Image(Asset.splashScreen.name)
          .offset(x: CGFloat(xx))
          .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
              self.xx = 0
            }
          }
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          withAnimation {
            isActive = true
          }
        }
      }
    }
  }
}

struct SplashScreen_Previews: PreviewProvider {
  static var previews: some View {
    SplashScreen()
  }
}

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct ApplicantsIKTIBApp: App {

  @UIApplicationDelegateAdaptor(Appdelegete.self) var delegate

  var body: some Scene {
    WindowGroup {
      SplashScreen()
    }
  }
}

class Appdelegete: NSObject, UIApplicationDelegate {

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

      FirebaseApp.configure()
      return true
    }

  func application(
    _ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable: Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

    }

}

extension UINavigationController: UIGestureRecognizerDelegate {
  override open func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = self
  }

  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return viewControllers.count > 1
  }
}

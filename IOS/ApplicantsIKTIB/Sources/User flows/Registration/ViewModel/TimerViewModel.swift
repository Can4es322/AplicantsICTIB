import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var currentSecond = 59
    @Published timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var text = ""
}

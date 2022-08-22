import SwiftUI

struct TabSelector: View {
  @Binding var selectedIndex: Int
  @State private var underlineWidths: [CGFloat] = []
  let titles = [L10n.eventsNavigationAll, L10n.eventsNavigationRecerved]

  var body: some View {
    VStack(alignment: .center, spacing: 2) {
      Text(L10n.eventsTitle)
        .font(.system(size: 25, weight: .bold))
        .padding(.bottom, 13)

      HStack(spacing: 50) {
        ForEach(Array(titles.enumerated()), id: \.1) { index, item in
          VStack {
            let selected: Bool = {
                self.selectedIndex == index ? true : false
            }()
            selectorItem(item, swicth: selected)
              .onTapGesture {
                  if selectedIndex != index {
                    self.selectedIndex = index
                  }
              }

            Spacer()

            if selected {
              RoundedRectangle(cornerRadius: 2)
                .frame(width: 70, height: 2, alignment: .center)
                .foregroundColor(Color(Asset.blue2.name))
            }
          }
          .frame(width: 120, height: 24, alignment: .center)
        }
      }
      Divider()
    }
  }

  private func selectorItem(_ title: String, swicth: Bool) -> some View {
      Text(title)
          .foregroundColor(
              swicth
              ? .black
              : Color(Asset.gray1.name)
          )
          .font(.system(size: 16, weight: .regular))
  }
}

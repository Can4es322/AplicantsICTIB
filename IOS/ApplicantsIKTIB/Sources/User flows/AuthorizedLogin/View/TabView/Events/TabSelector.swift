import SwiftUI

struct TabSelector: View {
  // MARK: State

  @Binding var selectedIndex: Int

  // MARK: Properties

  let titles: [String]
  var font: Font = .system(size: 16, weight: .regular)

  // MARK: UI
  
  var body: some View {
    if titles.isEmpty {
      EmptyView()
    } else {
        VStack(alignment: .leading, spacing: 6) {
          HStack(spacing: 0) {
            ForEach(Array(titles.enumerated()), id: \.1) { index, item in
              let selected: Bool = {
                self.selectedIndex == index ? true : false
              }()
              selectorItem(item, swicth: selected)

              // MARK: OnTap Action

                .onTapGesture {
                  if selectedIndex != index {
                    self.selectedIndex = index
                    
                  }
                }
            }
            .frame(maxWidth: .infinity)
          }// end HStack
        }
    }// end GeometryReader
  }// end if else
}

// MARK: UI Components

private func selectorItem(_ title: String, swicth: Bool) -> some View {
  Text(title)
    .foregroundColor(
      swicth
      ? .black
      : .blue
    )
}

struct RoomSelectorStackView_Previews: PreviewProvider {
  static var previews: some View {
      RoomSelectorStackViewPreview()
  }

  struct RoomSelectorStackViewPreview: View {
    @State var tempIndex = 0
    let rooms = ["Все", "Я иду"]
    var body: some View {
      VStack {
        TabSelector(selectedIndex: $tempIndex, titles: rooms)
          .frame(height: 24)
        Divider()
        
        Spacer()
      }
    }
  }
}

import SwiftUI

struct TabSelector: View {
    // MARK: State

    @Binding var selectedIndex: Int
    @State private var underlineWidths: [CGFloat] = []

    // MARK: Properties

  
    let titles: [String]
    var font: Font = FontFamily.OpenSans.regular.font(size: 20)

    // MARK: UI

    var body: some View {
        if titles.isEmpty {
            EmptyView()
        } else {
            GeometryReader { proxy in
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

                    if !underlineWidths.isEmpty {
                        underline()
                            .modifier(
                                SlidingOffset(
                                    rooms: titles.count,
                                    index: selectedIndex,
                                    geometryWidth: proxy.size.width,
                                    underlineWidth: underlineWidths[selectedIndex]
                                )
                            )
                    }
                }// end VStack
            }// end GeometryReader
        }// end if else
    }

    // MARK: UI Components

    private func selectorItem(_ title: String, swicth: Bool) -> some View {
        Text(title)
            .foregroundColor(
                swicth
                ? Colors.neutral500.color
                : Colors.neutral200.color
            )
            .font(font)
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .onAppear {
                            underlineWidths.insert(proxy.size.width, at: 0)
                        }
                }
            )
    }

    private func underline() -> some View {
        RoundedRectangle(cornerRadius: 2)
            .frame(width: underlineWidths[selectedIndex], height: 2)
            .foregroundColor(Colors.primary500.color)
    }
}

struct RoomSelectorStackView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.white)
                .shadow(color: Colors.neutral150.color, radius: 3, x: 0, y: 5)
                .frame(height: 42)

            RoomSelectorStackViewPreview()
                .previewInterfaceOrientation(.portrait)
        }
    }

    struct RoomSelectorStackViewPreview: View {
        @State var tempIndex = 2
        let rooms = ["423", "421", "4", "41", "555555"]
        var body: some View {
            VStack {
                TabSelector(selectedIndex: $tempIndex, titles: rooms)
                    .frame(height: 42)

                Spacer()
            }
        }
    }
}

// TODO: Make better
struct SlidingOffset: ViewModifier {
    var rooms: Int
    var index: Int
    var geometryWidth: CGFloat
    var underlineWidth: CGFloat
    let slideAnimation = Animation.spring(
        response: 0.4,
        dampingFraction: 1.0,
        blendDuration: 1.2
    )

    func body(content: Content) -> some View {
        content
            .offset(
                x: (geometryWidth / (Double(rooms * 2))
                - (underlineWidth / 2))
                + (geometryWidth / Double(rooms))
                * Double(index)
            )
            .animation(slideAnimation, value: index)
    }
}

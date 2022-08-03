//
//  EventView.swift
//  ApplicantsIKTIB
//
//  Created by User on 18.05.2022.
//

import SwiftUI

struct EventView: View {
    @StateObject var viewData = ViewController()

    var body: some View {
        NavigationView {
            VStack {
                Text("Мероприятия")
                    .font(.system(size: 25, weight: .regular))
                    .padding(.top, 30)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
//                        ForEach(viewData.events?.data ?? event) {post in
//                            EventPost(
//                                placeHolderImage: URL(string: post.image)!,
//                                placeHolderShortAddress: post.shortAddress,
//                                placeHolderTitle: post.title,
//                                placeHolderDescription: post.description,
//                                placeHolderAddress: post.address, placeHolderId: post.id,
//                                placeHolderStartDate: post.startDate,
//                                placeHolderEndDate: post.endDate)
//                        }

                        GeometryReader { reader -> Color in

                            let minY = reader.frame(in: .global).minY

                            let height = UIScreen.main.bounds.height / 1.5

//                            if viewData.events?.meta.hasNextPage == true && minY < height {
//                                DispatchQueue.main.async {
//                                    viewData.loadMoreContentEvents()
//                                }
//
//                            }

                            return Color.clear
                        }
                        .frame(width: 20, height: 20)
                    }
                    .frame(maxHeight: .infinity)
                }
                .padding(.top, 10)

                Spacer()
            }
            .task {
                viewData.sendEvents(numberTake: 5)
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}

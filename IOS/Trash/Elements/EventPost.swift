//
//  Event.swift
//  ApplicantsIKTIB
//
//  Created by User on 19.05.2022.
//

import SwiftUI

struct EventPost: View {

    var placeHolderImage: URL
    var placeHolderShortAddress: String
    var placeHolderTitle: String
    var placeHolderDescription: String
    var placeHolderAddress: String
    var placeHolderId: Int
    var placeHolderStartDate: String
    var placeHolderEndDate: String

    var body: some View {
        NavigationLink(destination: EventTap(
            placeHolderImage: placeHolderImage, placeHolderShortAddress: placeHolderShortAddress, placeHolderTitle: placeHolderTitle, placeHolderDescription: placeHolderDescription,
                  placeHolderAddress: placeHolderAddress, placeHolderId: placeHolderId,
                  placeHolderStartDate: placeHolderStartDate,
                  placeHolderEndDate: placeHolderEndDate
            )) {
                VStack {
                    AsyncImage(url: placeHolderImage) { image in
                        image
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 100)

                    }placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 100)
                    }

                    HStack {
                        HStack(spacing: 5) {
                            Image("MapIcon")

                            Text(placeHolderShortAddress)
                                .font(.system(size: 13, weight: .regular))
                                .foregroundColor(Color("activeTabText"))
                        }

                        Spacer()

                        Text(placeHolderStartDate)
                            .font(.system(size: 13, weight: .regular))

                    }
                    .padding(.top, 4)

                    Text(placeHolderTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(.leading, 3)

                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
        }
        .foregroundColor(.black)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }
}

struct Event_Previews: PreviewProvider {
    static var previews: some View {
        EventPost(
            placeHolderImage: URL(string: "ds")!,
            placeHolderShortAddress: "Корпус А",
            placeHolderTitle: "В ЮФУ ИКТИБ стартовал хакатон CyverGarden 2021",
            placeHolderDescription: "sdfkds",
            placeHolderAddress: "asf",
            placeHolderId: 1,
            placeHolderStartDate: "123",
            placeHolderEndDate: "233"
        )
    }
}

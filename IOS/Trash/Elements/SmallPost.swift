//
//  SmallPost.swift
//  ApplicantsIKTIB
//
//  Created by User on 19.05.2022.
//

import SwiftUI

struct SmallPost: View {
    var placeHolderImage: URL
    var placeHolderTitle: String
    var placeHolderDate: String
    var placeHolderDescription: String

    var body: some View {
        NavigationLink(destination: NewTap(
            placeHolderImage: placeHolderImage,
            placeHolderTitle: placeHolderTitle,
            placeHolderDate: placeHolderDate,
            placeHolderDescription: placeHolderDescription )) {
                HStack(spacing: 10) {
                    AsyncImage(url: placeHolderImage) { image in
                        image
                            .resizable()
                            .frame(maxWidth: 84, maxHeight: 84)

                    }placeholder: {
                        ProgressView()
                            .frame(maxWidth: 84, maxHeight: 84)
                    }

                    VStack {
                        Text(placeHolderTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15, weight: .semibold))

                        Spacer()

                        Text(placeHolderDate)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 12, weight: .regular))
                            .padding(.bottom, 23)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 84, alignment: .center)
                .padding(.leading, 16)
            }
            .foregroundColor(.black)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct SmallPost_Previews: PreviewProvider {
    static var previews: some View {
        SmallPost(
            placeHolderImage: URL(string: "")!,
            placeHolderTitle: "В ЮФУ ИКТИБ стартовал хакатон CyverGarden 2021",
            placeHolderDate: "Март 21, 2021",
            placeHolderDescription: "dkijsfkjdsk")
    }
}

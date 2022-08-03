//
//  NewTap.swift
//  ApplicantsIKTIB
//
//  Created by User on 31.05.2022.
//

import SwiftUI

struct NewTap: View {

    var placeHolderImage: URL
    var placeHolderTitle: String
    var placeHolderDate: String
    var placeHolderDescription: String

    var body: some View {
        VStack {
            Button {

            } label: {
                Image("back-img")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 24)
            }
            .padding(.top, 28)

            AsyncImage(url: placeHolderImage) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .padding(.top, 10)

            }placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 300)
            }

            Text(placeHolderTitle)
                .font(.system(size: 18, weight: .bold))
                .padding(.horizontal, 10)

            Text(placeHolderDate)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(Color("TextReg"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 5)

            Text(placeHolderDescription)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color("Gray2"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 10)

            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct NewTap_Previews: PreviewProvider {
    static var previews: some View {
        NewTap(
            placeHolderImage: URL(string: "avd")!,
            placeHolderTitle: "В ЮФУ ИКТИБ стартовал Хакатон Кибер Гарден 2021",
            placeHolderDate: "Март 21, 2021",
            placeHolderDescription: "fjdigfjd gjfdkjhf kjdskjfhdksjfldsjfkldjs kjdksjfkldsj")
    }
}

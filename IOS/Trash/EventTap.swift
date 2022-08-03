//
//  EventTap.swift
//  ApplicantsIKTIB
//
//  Created by User on 01.06.2022.
//

import SwiftUI

struct EventTap: View {

    var placeHolderImage: URL
    var placeHolderShortAddress: String
    var placeHolderTitle: String
    var placeHolderDescription: String
    var placeHolderAddress: String
    var placeHolderId: Int
    var placeHolderStartDate: String
    var placeHolderEndDate: String

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
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18, weight: .bold))
                .padding(.horizontal, 15)

            HStack(spacing: 5) {
                Image("MapIcon")

                Text(placeHolderAddress)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 12, weight: .regular))

                    .foregroundColor(Color("Blue"))

            }
            .padding(.horizontal, 15)
            .padding(.top, 5)

            VStack(spacing: 5) {
                Text("начало: "+placeHolderStartDate)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color("TextReg"))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("конец: " + placeHolderEndDate)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color("TextReg"))
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
            .padding(.horizontal, 15)

            Text(placeHolderDescription)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color("Gray2"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.top, 15)

            Spacer()

            HStack(spacing: 10) {
                Button {

                }label: {
                    Text("Записаться")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)

                }
                .frame(width: 208, height: 44)
                .background(.blue)
                .cornerRadius(100)

                HStack {
                    Image("User")

                    Text("34/50")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.blue)
                }
                .frame(width: 100, height: 44)
                .background(Color("EnterButton"))
                .cornerRadius(100)

            }
            .padding(.bottom, 20)

        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct EventTap_Previews: PreviewProvider {
    static var previews: some View {
        EventTap(
            placeHolderImage: URL(string: "asd")!,
            placeHolderShortAddress: "Корпус А",
            placeHolderTitle: "В ЮФУ ИКТИБ стартовал хакатон CyverGarden 2021",
            placeHolderDescription: "sdfkds",
            placeHolderAddress: "Таганрог, Некрасовский 5",
            placeHolderId: 1,
            placeHolderStartDate: "13:00 Март 21, 2021",
            placeHolderEndDate: "21:00 Март 23, 2021")
    }
}

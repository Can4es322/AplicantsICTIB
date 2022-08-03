//
//  SuccesEneter.swift
//  ApplicantsIKTIB
//
//  Created by User on 24.05.2022.
//

import SwiftUI

struct SuccesEneter: View {
    @State var button = false
    @StateObject var viewData = ViewController()

    var token: String?

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Ура!")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 24, weight: .regular))
                    Text("Регистрация прошла")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 24, weight: .regular))
                    Text("успешно.")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 24, weight: .regular))
                }
                .padding(.top, 127)

                Image("succesReg")
                    .padding(.top, 43)

                Spacer()

                NavigationLink(destination: MainView(), isActive: $viewData.isSuccesLogin) {
                    Button {
                        viewData.sendDataLogin(idToken: token)

                    } label: {
                        Text("Класс")
                            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                            .background(Color(Asset.darkBlue.name))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 70)

            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SuccesEneter_Previews: PreviewProvider {
    static var previews: some View {
        SuccesEneter(token: "123")
    }
}

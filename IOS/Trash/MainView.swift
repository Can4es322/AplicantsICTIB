//
//  MainView.swift
//  ApplicantsIKTIB
//
//  Created by User on 04.04.2022.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewData = ViewController()

    let tabBarImages = ["News", "Event", "profi"]
    let tabBarText = ["Главная", "Мероприятия", "Профиль"]
    let tabBarImagesActivity = ["ANews", "AEvent", "AProfile"]

    @State var selectedIndex = 0

    var body: some View {
        NavigationView {
            VStack {

                switch selectedIndex {
                case 0:
                    NewsView()
                case 1:
                    EventView()
                case 2:
                    ProfileView()
                default:
                    Text("Aboba")
                }

                Spacer()

                HStack {
                    ForEach(0..<3) { num in
                        Button {
                            selectedIndex = num
                        } label: {
                            Spacer()
                            VStack {
                                Image(selectedIndex == num ? tabBarImagesActivity[num]: tabBarImages[num])

                                Text(tabBarText[num])
                                    .font(.system(size: 11, weight: .regular))
                                    .foregroundColor(
                                        selectedIndex == num ?
                                        Color("activeTabText"):
                                        Color("tabTextColor")
                                    )
                            }
                            Spacer()
                        }

                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
                .background(Color("TabViewColor"))
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

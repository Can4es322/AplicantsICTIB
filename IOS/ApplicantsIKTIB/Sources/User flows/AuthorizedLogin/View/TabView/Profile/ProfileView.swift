import SwiftUI

struct ProfileView: View {
  let insetProfile = EdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 71)
  let insetExit = EdgeInsets(top: 0, leading: 20, bottom: 31, trailing: 0)
  let insetCardButtons = EdgeInsets(top: 27, leading: 17, bottom: 0, trailing: 17)
  @ObservedObject var loginData = LoginViewModel()
  @StateObject var server = ViewController()
  @Binding var isAuthorization: Int

  var body: some View {
    VStack {
      Text(L10n.profileTitle)
        .font(.system(size: 25, weight: .bold))
        .padding(.bottom, 31)

      HStack(spacing: 25) {
        AsyncImage(url: URL(string: server.profileData?.image ?? Asset.avatar.name)) { image in
          image
            .resizable()
            .scaledToFill()
            .frame(maxWidth: 95, maxHeight: 95, alignment: .center)
            .cornerRadius(8)

        }placeholder: {
          ProgressView()
            .frame(maxWidth: 95, maxHeight: 95, alignment: .center)
        }


        VStack(alignment: .leading, spacing: 12) {
          Text(server.lastName)
            .font(.system(size: 20, weight: .bold)) +
          Text(" ") +
          Text(server.firstName)
            .font(.system(size: 20, weight: .bold)) +
          Text(" ") +
          Text(server.middleName)
            .font(.system(size: 20, weight: .bold))

          HStack(alignment: .center, spacing: 3) {
            Text("\(server.profileData?.bonuses ?? 3)")
              .font(.system(size: 14, weight: .regular))
              .foregroundColor(.white)

            Image(Asset.money.name)

          }
          .frame(width: 98, height: 21)
          .background(Color(Asset.blue2.name))
          .cornerRadius(5)
        }
      }

      .padding(insetProfile)

      VStack(alignment: .leading, spacing: 20) {

        NavigationLink(destination: PersonDataView(placeHolderProfileData: server.profileData ?? profile)) {
          ProfileButton(
            placeHolderImage: Asset.person.name,
            placeHolderText: L10n.profeilePersonData)
          .padding(.top, 31)
        }

        NavigationLink(destination: ProfileEventsEttendView(isAuthorization: $isAuthorization)) {
          ProfileButton(
            placeHolderImage: Asset.desk.name,
            placeHolderText: L10n.profileEventVisit)
        }

        NavigationLink(destination: EmptyView()) {
          ProfileButton(
            placeHolderImage: Asset.order.name,
            placeHolderText: L10n.profileOrder)
        }

        NavigationLink(destination: EmptyView()) {
          ProfileButton(
            placeHolderImage: Asset.info.name,
            placeHolderText: L10n.profileAboutUs)
        }

        NavigationLink(destination: EmptyView()) {
          ProfileButton(
            placeHolderImage: Asset.message.name,
            placeHolderText: L10n.profileHelp)
        }

        Text(L10n.profileExit)
          .foregroundColor(Color(Asset.red.name))
          .font(.system(size: 15, weight: .regular))
          .padding(insetExit)
          .onTapGesture {
            loginData.firebaseAuth.signOutPerson()
            loginData.isSuccessEnter = false
            isAuthorization = 1
          }

      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.white)
      .padding(insetCardButtons)

      Spacer()
    }
    .task {
      Task {
        try await server.sendDataProfile()
      }
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
    .background(Color(Asset.gray6.name))
  }
}

//struct ProfileView_Previews: PreviewProvider {
//  static var previews: some View {
//    ProfileView()
//  }
//}

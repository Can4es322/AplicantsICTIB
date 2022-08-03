import SwiftUI

struct ProfileView: View {
  let insetProfile = EdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 71)
  let insetExit = EdgeInsets(top: 0, leading: 20, bottom: 31, trailing: 0)
  let insetCardButtons = EdgeInsets(top: 27, leading: 17, bottom: 0, trailing: 17)

  var body: some View {
    VStack {
      Text(L10n.profileTitle)
        .font(.system(size: 25, weight: .bold))
        .padding(.bottom, 31)

      HStack(spacing: 25) {
        Image(Asset.avatar.name)

        VStack(alignment: .leading, spacing: 12) {
          Text(L10n.profileName)
            .font(.system(size: 20, weight: .bold))

          HStack(alignment: .center, spacing: 3) {
            Text(L10n.profileCount)
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

        NavigationLink(destination: EmptyView()) {
          ProfileButton(
            placeHolderImage: Asset.person.name,
            placeHolderText: L10n.profeilePersonData)
          .padding(.top, 31)
        }

        NavigationLink(destination: EmptyView()) {
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

        NavigationLink(destination: EmptyView()) {
          Text(L10n.profileExit)
            .foregroundColor(Color(Asset.red.name))
            .font(.system(size: 15, weight: .regular))
            .padding(insetExit)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.white)
      .padding(insetCardButtons)

      Spacer()
    }
    .background(Color(Asset.gray6.name))
  }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

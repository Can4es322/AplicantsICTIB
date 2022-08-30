import SwiftUI

struct PersonDataView: View {
  enum FocusField: Hashable {
     case field
   }

  @ObservedObject var viewData = ServerHandler()
  @ObservedObject var profileData = EventsViewModel()
  @FocusState private var focusField: FocusField?
  var placeHolderProfileData: ProfileData

  var body: some View {
    VStack(spacing: 25) {
      VStack(spacing: 24) {

        TextFieldPersonData(
          placeHolderText: L10n.lastNameTextField,
          placeHolderBinding: $viewData.person.lastName,
          placeHolderFormatter: nil
        )
        .padding(.top, 13)

        TextFieldPersonData(
          placeHolderText: L10n.nameTextField,
          placeHolderBinding: $viewData.person.firstName,
          placeHolderFormatter: nil
        )

        TextFieldPersonData(
          placeHolderText: L10n.middleNameTextField,
          placeHolderBinding: $viewData.person.middleName,
          placeHolderFormatter: nil
        )

        TextFieldPersonData(
          placeHolderText: L10n.birthdayTextField,
          placeHolderBinding: $viewData.person.birthDate,
          placeHolderFormatter: BirthdayFormatter()
        )

        TextFieldPersonData(
          placeHolderText: L10n.cityTextField,
          placeHolderBinding: $viewData.person.city,
          placeHolderFormatter: nil
        )

        TextFieldPersonData(
          placeHolderText: L10n.schoolTextField,
          placeHolderBinding: $viewData.person.school,
          placeHolderFormatter: nil
        )
        .padding(.bottom, 18)
      }
      .background(.white)
      .cornerRadius(10)
      .padding(.horizontal, 18)
      .focused($focusField, equals: .field)
      .onAppear {
        self.focusField = .field
    }
      .disabled(profileData.isEdit)

      Button {
        profileData.isEdit = true
        focusField = nil
        Task {
          try await viewData.updateInfoPerson()
          viewData.showingAlertUpdateInfo = true
        }
      } label: {
        Text(L10n.profileSave)
          .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
          .font(.system(size: 16, weight: .semibold))
          .foregroundColor(.white)
          .background(Color(Asset.blue2.name))
          .cornerRadius(4)
          .padding(.horizontal, 15)
      }
      .alert(viewData.alertTextUpdateInfo, isPresented: $viewData.showingAlertUpdateInfo, actions: {})
      .opacity(!profileData.isEdit ? 1 : 0)

      Spacer()
    }
    .task {
      viewData.assignmentProfilData(date: placeHolderProfileData)
    }
    .navigationBarItems(
      leading: BackButton(),
      trailing: EditButton(isEdit: $profileData.isEdit)
    )
    .toolbar(content: {
      ToolbarItem(placement: ToolbarItemPlacement.principal) {
        VStack {
          Text(L10n.dataPerson)
            .font(.system(size: 20, weight: .bold))
        }
      }
    })
    .navigationBarBackButtonHidden(true)
    .frame(maxHeight: .infinity)
    .background(Color(Asset.gray6.name))
  }
}

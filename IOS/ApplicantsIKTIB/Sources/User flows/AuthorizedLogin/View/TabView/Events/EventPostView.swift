import SwiftUI

struct EventPostView: View {
  var placeHolderEventData: Event
  let insetContent = EdgeInsets(top: 15, leading: 16, bottom: 0, trailing: 0)
  @ObservedObject var server = ViewController()
  @StateObject var eventsData = EventsViewModel()
  @Binding var isAuthorization: Int

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .leading) {
        VStack {
          AsyncImage(url: URL(string: placeHolderEventData.image)) { image in
            image
              .resizable()
              .scaledToFill()
              .frame(width: 335, height: 286, alignment: .center)
              .cornerRadius(10)
          }placeholder: {
            ProgressView()
              .frame(width: 335, height: 286, alignment: .center)
          }
          .padding([.top, .bottom], 16)
        }

        EventTag(placeHolderTag: placeHolderEventData.tags, placeHolderMoney: placeHolderEventData.bonuses)
          .padding(.bottom, 12)

        Text(L10n.eventPostTitle)
          .font(.system(size: 14, weight: .regular))
          .foregroundColor(.black)

        HStack {
          Image(Asset.date.name)

          Text("Начало: ")
            .font(.system(size: 12, weight: .regular)) +
          Text(eventsData.timeStart ?? "aboba")
            .font(.system(size: 12, weight: .regular)) +
          Text(", ")
            .font(.system(size: 12, weight: .regular)) +
          Text(eventsData.dayWeekStart ?? "Пн")
            .font(.system(size: 12, weight: .regular)) +
          Text(" ") +
          Text(eventsData.dayStart ?? "aboba")
            .font(.system(size: 12, weight: .regular))
        }

        HStack {
          Image(Asset.time.name)

          Text("Конец: ")
            .font(.system(size: 12, weight: .regular)) +
          Text(eventsData.timeEnd ?? "aboba")
            .font(.system(size: 12, weight: .regular)) +
          Text(", ")
            .font(.system(size: 12, weight: .regular)) +
          Text(eventsData.dayWeekEnd ?? "Пн")
            .font(.system(size: 12, weight: .regular)) +
          Text(" ") +
          Text(eventsData.dayEnd ?? "aboba")
            .font(.system(size: 12, weight: .regular))
        }

        HStack {
          Image(Asset.map.name)
            .renderingMode(.template)
            .foregroundColor(.black)

          Text(placeHolderEventData.address)
            .font(.system(size: 12, weight: .regular))
        }

        Text(L10n.eventsDescription)
          .font(.system(size: 14, weight: .regular))
          .foregroundColor(.black)
          .padding(.top, 15)

        Text(placeHolderEventData.description)
          .font(.system(size: 14, weight: .regular))
          .foregroundColor(.black)
          .padding(.top, 6)

        switch eventsData.isSignUpEvent {
        case 2:
          VStack(spacing: 16) {
            Button {
              eventsData.showingAlert = true
            }label: {
              Text("Отменить запись")
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .background(Color(Asset.red2.name))
            }
            .padding(.top, 32)
            .alert("Отменить запись на мероприятие?", isPresented: $eventsData.showingAlert) {
              HStack {
                Button("Нет", role: .cancel) { }

                Button {
                  Task {
                    try await server.signUpForEvent(idEvent: placeHolderEventData.id)
                    eventsData.checkPersonSignUpEvent(specificEvent: server.specificEvent ?? specificEventData, signUpEvent: server.signUpEvent ?? signUpEventData)
                  }
                } label: {
                  Text("Да")
                }
              }
            }

            Text("После начала мероприятия не забудьте подтвердить своё присутствие")
              .frame(maxWidth: .infinity, alignment: .leading)
              .font(.system(size: 14, weight: .regular))
              .foregroundColor(Color(Asset.gray1.name))
          }

        case 3:
          VStack(alignment: .leading, spacing: 8) {
            Text("Подтвердите присутствие:")
              .foregroundColor(.black)
              .font(.system(size: 14, weight: .regular))

            TextField("", text: $eventsData.textFieldCode)
          }
          .padding(.top, 24)

          Divider()
            .frame(height: 1)
            .foregroundColor(Color(Asset.gray2.name))

          if !server.isSuccessCode {
            Text(L10n.failCode)
              .font(.system(size: 16, weight: .regular))
              .foregroundColor(Color(Asset.red.name))
          }

          Button {
            Task {
              try await server.sendServerCode(idEvent: placeHolderEventData.id, code: eventsData.textFieldCode)
              eventsData.checkPersonSignUpEvent(specificEvent: server.specificEvent ?? specificEventData, signUpEvent: server.signUpEvent ?? signUpEventData)
            }
          }label: {
            Text("Подтвердить")
              .frame(maxWidth: .infinity)
              .frame(height: 44)
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
              .background(eventsData.checkEmptyCode() ? Color(Asset.gray2.name) : Color(Asset.blue2.name))
          }
          .padding(.top, 32)
          .disabled(eventsData.checkEmptyCode())

        case 4:
          Text("")

        case 5:
          Text("Вы отмечены на мероприятии!")
            .font(.system(size: 14, weight: .bold))
            .padding(.top, 20)

        case 6:
          Button {
            isAuthorization = 1
          }label: {
            Text("Зарегестрируйтесь чтобы записаться")
              .frame(maxWidth: .infinity)
              .frame(height: 44)
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
              .background(Color(Asset.blue2.name))
          }
          .padding(.top, 32)
        default:
          Button {
            Task {
              try await server.signUpForEvent(idEvent: placeHolderEventData.id)
              eventsData.checkStateOneSignUpEvent(signUpEvent: server.signUpEvent ?? signUpEventData)
            }
          }label: {
            Text(L10n.eventsButton)
              .frame(maxWidth: .infinity)
              .frame(height: 44)
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
              .background(Color(Asset.blue2.name))
          }
          .padding(.top, 32)
        }

        Spacer()
      }
      .task {
        Task {
          try await server.sendSpecificEvent(idEvent: placeHolderEventData.id)
          eventsData.getDayOfWeek(startDate: placeHolderEventData.startDate, endDate: placeHolderEventData.endDate)
          eventsData.dateBuilding(startDate: placeHolderEventData.startDate, endDate: placeHolderEventData.endDate)
          eventsData.checkPersonSignUpEvent(specificEvent: server.specificEvent ?? specificEventData, signUpEvent: server.signUpEvent ?? signUpEventData)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 15)
      .navigationTitle(placeHolderEventData.title)
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(leading: BackButton())
    }
  }
}

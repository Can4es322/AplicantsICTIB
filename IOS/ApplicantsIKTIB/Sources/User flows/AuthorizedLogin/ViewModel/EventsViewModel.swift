import SwiftUI

class EventsViewModel: ObservableObject {
  @Published var isTapButtonAll = false
  @Published var isTapButtonRecorded = false
  @Published var isEdit = true
  @Published var dayStart: String?
  @Published var dayEnd: String?
  @Published var isLongDate = false
  @Published var timeStart: String?
  @Published var timeEnd: String?
  @Published var dayWeekStart: String?
  @Published var dayWeekEnd: String?
  @Published var textFieldCode = ""
  @Published var isSignUpEvent = 1
  @Published var showingAlert = false
  @Published var createdAt: String?
  @Published var isShowingBottomSheet = false

  func checkLongDate(startDate: Date, endDate: Date) {

    self.dateBuilding(startDate: startDate, endDate: endDate)

    if dayStart == dayEnd {
      isLongDate = false
    } else {
      isLongDate = true
    }
  }

  func dateBuildingNews(startDate: Date) {
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "dd.mm.yyyy"

    self.createdAt = timeFormatter.string(from: startDate)
  }

  func dateBuilding(startDate: Date, endDate: Date) {

    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "HH:mm"

    self.timeStart = timeFormatter.string(from: startDate)
    self.timeEnd = timeFormatter.string(from: endDate)

    timeFormatter.dateFormat = "dd MMMM"

    self.dayStart = timeFormatter.string(from: startDate)
    self.dayEnd = timeFormatter.string(from: endDate)
  }

  func getDayOfWeek(startDate: Date, endDate: Date) {

    let weekDays = [
      "Вс",
      "Пн",
      "Вт",
      "Ср",
      "Чт",
      "Пт",
      "Сб"
    ]

    let myCalendar = Calendar(identifier: .gregorian)
    let weekDay1 = myCalendar.component(.weekday, from: startDate)
    let weekDay2 = myCalendar.component(.weekday, from: endDate)

    self.dayWeekStart = weekDays[weekDay1-1]
    self.dayWeekEnd = weekDays[weekDay2-1]
  }

  func checkPersonSignUpEvent(specificEvent: SpecificEvent, signUpEvent: SignUpEvent) {
    if specificEvent.eventId != nil && specificEvent.userId != nil {

      if Date() >= specificEvent.event.startDate && Date() <= specificEvent.event.endDate {
        if signUpEvent.isPresent || specificEvent.isPresent ?? true {
          self.isSignUpEvent = 5
        } else {
          self.isSignUpEvent = 3
        }
      }

      if Date() < specificEvent.event.startDate {
        self.isSignUpEvent = 2
      }

      if Date() > specificEvent.event.endDate {
        self.isSignUpEvent = 4
      }
    } else {

      if specificEvent.anonymousUser {
        self.isSignUpEvent = 6
      } else {
        if Date() >= specificEvent.event.startDate {
          self.isSignUpEvent = 4
        }

        if Date() < specificEvent.event.startDate {
          self.isSignUpEvent = 1
        }

      }
    }
  }

  func checkStateOneSignUpEvent(signUpEvent: SignUpEvent) {
    if signUpEvent.eventId != nil && signUpEvent.userId != nil {
      self.isSignUpEvent = 2
    } else {
      self.isSignUpEvent = 1
    }
  }

  func checkEmptyCode() -> Bool {
    if textFieldCode != "" {
      return false
    } else {
      return true
    }
  }

}

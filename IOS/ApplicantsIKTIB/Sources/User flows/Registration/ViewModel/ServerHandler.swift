import Alamofire
import SwiftUI
import Foundation

class ServerHandler: ObservableObject {
  @ObservedObject var firebaseAuth = FirebaseViewModel()
  @ObservedObject var server = AlamofireViewModel()

  @Published var profileData: ProfileData?
  @Published var specificEvent: SpecificEvent?
  @Published var person = PersonData(
    firstName: "",
    lastName: "",
    birthDate: "",
    middleName: "",
    school: "",
    city: ""
  )

  @Published var showingAlertUpdateInfo = false
  @Published var alertTextUpdateInfo = ""

  @Published var isSuccesLogin = false
  @Published var isSuccesReg = false
  @Published var events: Events1?
  @Published var recordedEvents: Events1?
  @Published var visitedEvents: Events1?
  @Published var newsEvent: News?
  @Published var firstName = ""
  @Published var lastName = ""
  @Published var middleName = ""
  @Published var signUpEvent: SignUpEvent?
  @Published var isSuccessCode = true
  var take = 5
  private let baseUrl = "https://enrollee-ictis.sfedu.ru/api/"

  func assignmentProfilData(date: ProfileData) {
    person.firstName = date.firstName
    person.lastName = date.lastName
    person.middleName = date.middleName ?? ""
    person.birthDate = date.birthDate
    person.school = date.school
    person.city = date.city
  }

  func checkPersonData() -> Bool {
    return person.lastName == "" || person.firstName == "" || person.middleName == ""
    || person.birthDate == "" || person.city == "" || person.school == "" ? true : false
  }

  func sendDataRegistration(idToken: String?) async throws {
    isSuccesReg = try await server.sendDataRegistration(idToken: idToken, person: person)
  }

  func sendDataLogin(idToken: String?) async throws {
    isSuccesLogin = try await server.sendDataLogin(idToken: idToken)
  }

  func sendEvents(numberTake: Int) async throws {
    events = try await server.sendEvents(numberTake: numberTake)
  }

  func loadMoreContentEvents() async throws {
    if events?.meta.page ?? 1 < events?.meta.pageCount ?? 1 {
      take += 1
      try await self.sendEvents(numberTake: take)
    }
  }

  func sendDataProfile() async throws {
    profileData = try await server.sendDataProfile()
    firstName = profileData?.firstName ?? ""
    lastName = profileData?.lastName ?? ""
    middleName = profileData?.middleName ?? ""
  }

  func sendSpecificEvent(idEvent: Int) async throws {
    specificEvent = try await server.sendSpecificEvent(idEvent: idEvent)
  }

  func signUpForEvent(idEvent: Int) async throws {
    signUpEvent = try await server.signUpForEvent(idEvent: idEvent)
  }

  func sendServerCode(idEvent: Int, code: String) async throws {
    signUpEvent = try await server.sendServerCode(idEvent: idEvent, code: code)
    if signUpEvent?.eventId != nil && signUpEvent?.userId != nil {
      isSuccessCode = true
    } else {
      isSuccessCode = false
    }
  }

  func sendRecordedEvents() async throws {
    recordedEvents = try await server.sendRecordedEvents()
  }

  func sendVisitedEvents() async throws {
    visitedEvents = try await server.sendVisitedEvents()
  }

  func updateInfoPerson() async throws {
    alertTextUpdateInfo = try await server.updateInfoPerson(person: person)
  }

  func sendNews(numberTake: Int) async throws {
    newsEvent = try await server.sendNews(numberTake: numberTake)
  }
}

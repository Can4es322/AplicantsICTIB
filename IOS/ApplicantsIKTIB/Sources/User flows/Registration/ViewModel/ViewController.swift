import Alamofire
import SwiftUI
import Foundation

extension DateFormatter {
  static let iso8601Full: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    return formatter
  }()
}

class ViewController: ObservableObject {

  @ObservedObject var firebaseAuth = FirebaseViewModel()
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
    guard let url = URL(string: self.baseUrl + "register") else {return}
    
    let headers: HTTPHeaders
    
    if let token = idToken {
      headers = [
        "Authorization": "Bearer " + token
      ]
    } else {
      headers = [
        "Authorization": ""
      ]
    }
    
    try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
      AF.request(url, method: .post,
                 parameters: person,
                 encoder: JSONParameterEncoder.default,
                 headers: headers).validate(statusCode: 200..<300).response { response in
        debugPrint(response)
        
        switch response.result {
        case .success:
          self.isSuccesReg = true
          continuation.resume()
        case .failure:
          self.isSuccesReg = false
          continuation.resume()
        }
        
      }
    }
  }
  
  func sendDataLogin(idToken: String?) async throws {
    guard let url = URL(string: self.baseUrl + "login") else {return }
    
    let headers: HTTPHeaders
    
    if let token = idToken {
      headers = [
        "Authorization": "Bearer " + token
      ]
    } else {
      headers = [
        "Authorization": ""
      ]
    }
    
    try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
      AF.request(url, method: .post, headers: headers).validate(statusCode: 200..<300)
        .response { response in
          debugPrint(response)
          switch response.result {
          case .success:
            self.isSuccesLogin = true
            continuation.resume()
            return
            
          case .failure:
            self.isSuccesLogin = false
            return
          }
        }
    }
  }



  func sendEvents(numberTake: Int) async throws {
    guard let url = URL(string: self.baseUrl + "events/CurrentAndFutureEvents") else {return}
    
    let parameters: Parameters = [
      "order": "DESC",
      "page": "1",
      "take": "\(numberTake)"
    ]
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

    try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
      AF.request(url, method: .get,
                 parameters: parameters,
                 encoding: URLEncoding(destination: .queryString))
      .responseDecodable(of: Events1.self, decoder: decoder) { response in
        debugPrint(response)
        switch response.result {
        case .success:
          self.events = response.value
          continuation.resume()
        case .failure:
          continuation.resume()
        }
      }
    }
  }

  func loadMoreContentEvents() async throws {
    if self.events?.meta.page ?? 1 < self.events?.meta.pageCount ?? 1 {
      take += 1
      try await self.sendEvents(numberTake: take)
    }
  }

  func sendDataProfile() async throws {
    if let uid = firebaseAuth.getUserID() {
      guard let url = URL(string: self.baseUrl + "users/id/\(uid)") else {return}

      try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
        AF.request(url, method: .get).responseDecodable(of: ProfileData.self) { [self] response in
          debugPrint(response)
          switch response.result {
          case .success:
            self.profileData = response.value
            self.firstName = response.value?.firstName ?? ""
            self.lastName = response.value?.lastName ?? ""
            self.middleName = response.value?.middleName ?? ""
            continuation.resume()
          case .failure:
            break
          }
        }
      }
    }
  }

  func sendSpecificEvent(idEvent: Int) async throws {
    if let uid = firebaseAuth.getUserID() {
      guard let url = URL(string: self.baseUrl + "events/id/\(idEvent)") else {return}

      let parameters: Parameters = [
        "firebaseUID": "\(uid)"
      ]

      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

      try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
        AF.request(url, method: .get,
                   parameters: parameters,
                   encoding: URLEncoding(destination: .queryString))
        .responseDecodable(of: SpecificEvent.self, decoder: decoder) { response in
          debugPrint(response)
          switch response.result {
          case .success:
            self.specificEvent = response.value
            continuation.resume()
          case .failure:
            continuation.resume()
          }
        }
      }
    }
  }

  func signUpForEvent(idEvent: Int) async throws {
    if let uid = firebaseAuth.getUserID() {
      guard let url = URL(string: self.baseUrl + "events/id/\(idEvent)/signToEvent") else {return}

      let parameters: Parameters = [
        "firebaseUID": "\(uid)"
      ]

      try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
        AF.request(url, method: .post,
                   parameters: parameters,
                   encoding: URLEncoding(destination: .queryString))
        .responseDecodable(of: SignUpEvent.self) { response in
          debugPrint(response)
          switch response.result {
          case .success:
            self.signUpEvent = response.value
            continuation.resume()
          case .failure:
            continuation.resume()
          }
        }
      }
    }
  }

  func sendServerCode(idEvent: Int, code: String) async throws {
    if let uid = firebaseAuth.getUserID() {
      guard let url = URL(string: self.baseUrl + "events/id/\(idEvent)/eventConfirmation") else {return}

      let parameters: Parameters = [
        "firebaseUID": "\(uid)",
        "code": "\(code)"
      ]

      try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
        AF.request(url, method: .post,
                   parameters: parameters,
                   encoding: URLEncoding(destination: .queryString))
        .responseDecodable(of: SignUpEvent.self) { response in
          debugPrint(response)
          switch response.result {
          case .success:
            self.signUpEvent = response.value
            self.isSuccessCode = true
            continuation.resume()
          case .failure:
            self.isSuccessCode = false
            continuation.resume()
          }
        }
      }
    }
  }

  func sendRecordedEvents() async throws {
    if let uid = firebaseAuth.getUserID() {
      guard let url = URL(string: self.baseUrl + "events/FutureSigned/userId") else {return}

      let parameters: Parameters = [
        "firebaseUID": "\(uid)"
      ]
      
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

      try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
        AF.request(url, method: .get,
                   parameters: parameters,
                   encoding: URLEncoding(destination: .queryString))
        .responseDecodable(of: Events1.self, decoder: decoder) { response in
          debugPrint(response)
          switch response.result {
          case .success:
            self.recordedEvents = response.value
            continuation.resume()
          case .failure:
            continuation.resume()
          }
        }
      }
    }
  }

  func sendVisitedEvents() async throws {
    if let uid = firebaseAuth.getUserID() {
      guard let url = URL(string: self.baseUrl + "events/visited/userId") else {return}

      let parameters: Parameters = [
        "firebaseUID": "\(uid)"
      ]

      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

      try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
        AF.request(url, method: .get,
                   parameters: parameters,
                   encoding: URLEncoding(destination: .queryString))
        .responseDecodable(of: Events1.self, decoder: decoder) { response in
          debugPrint(response)
          switch response.result {
          case .success:
            self.visitedEvents = response.value
            continuation.resume()
          case .failure:
            continuation.resume()
          }
        }
      }
    }
  }

  func updateInfoPerson() async throws {
    if let uid = firebaseAuth.getUserID() {
      guard let url = URL(string: self.baseUrl + "users/id/\(uid)/update") else {return}

      try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
        AF.request(url, method: .post,
                   parameters: person,
                   encoder: JSONParameterEncoder.default)
        .response { response in
          debugPrint(response)
          switch response.result {
          case .success:
            self.alertTextUpdateInfo = "Данные успешно обновлены"
            continuation.resume()
          case .failure:
            self.alertTextUpdateInfo = "Ошибка, попробуйте позже"
            continuation.resume()
          }
        }
      }
    }
  }

  func sendNews(numberTake: Int) async throws {
    guard let url = URL(string: self.baseUrl + "news/all") else {return}

    let parameters: Parameters = [
      "order": "DESC",
      "page": "1",
      "take": "\(numberTake)"
    ]

    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

    try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
      AF.request(url, method: .get,
                 parameters: parameters,
                 encoding: URLEncoding(destination: .queryString))
      .responseDecodable(of: News.self, decoder: decoder) { response in
        debugPrint(response)
        switch response.result {
        case .success:
          self.newsEvent = response.value
          continuation.resume()
        case .failure:
          continuation.resume()
        }
      }
    }
  }

}

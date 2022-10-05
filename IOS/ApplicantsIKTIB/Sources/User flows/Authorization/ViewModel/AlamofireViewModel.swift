import Alamofire
import SwiftUI
import Foundation

class AlamofireViewModel: ObservableObject {
	@ObservedObject var firebaseAuth = FirebaseViewModel()

	private let baseUrl = "https://enrollee-ictis.sfedu.ru/api/"

	func checkEmail(email: String) async throws -> Bool? {
		guard let url = URL(string: self.baseUrl + "checkEmail") else {return nil}

		let parameters: Parameters = [
			"email": email
		]

		var checkEmail: Bool?

		try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
			AF.request(url, method: .get,
					   parameters: parameters,
					   encoding: URLEncoding(destination: .queryString)).validate(statusCode: 200..<300).responseDecodable(of: Bool.self) { response in
				debugPrint(response)

				switch response.result {
				case .success:
					checkEmail = response.value
					print(checkEmail!)
					continuation.resume()
				case .failure:
					continuation.resume()
				}
			}
		}
		return checkEmail
	}

	func sendDataRegistration(idToken: String?, person: PersonData) async throws -> Bool {
		guard let url = URL(string: self.baseUrl + "register") else {return false}
		
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
		
		var success = false
		
		try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
			AF.request(url, method: .post,
					   parameters: person,
					   encoder: JSONParameterEncoder.default,
					   headers: headers).validate(statusCode: 200..<300).response { response in
				debugPrint(response)
				
				switch response.result {
				case .success:
					success = true
					continuation.resume()
				case .failure:
					success = false
					continuation.resume()
				}
			}
		}
		return success
	}
	
	func sendDataLogin(idToken: String?) async throws -> Bool {
		guard let url = URL(string: self.baseUrl + "login") else {return false}
		
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
		
		var success = false
		
		try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
			AF.request(url, method: .post, headers: headers).validate(statusCode: 200..<300)
				.response { response in
					debugPrint(response)
					switch response.result {
					case .success:
						success = true
						continuation.resume()
					case .failure:
						success = false
					}
				}
		}
		return success
	}
	
	func sendFutureEvents(numberTake: Int) async throws -> Events1? {
		guard let url = URL(string: self.baseUrl + "events/FutureEvents") else {return nil}
		
		let parameters: Parameters = [
			"order": "DESC",
			"page": "1",
			"take": "\(numberTake)"
		]
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)

		var events: Events1?
		
		try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
			AF.request(url, method: .get,
					   parameters: parameters,
					   encoding: URLEncoding(destination: .queryString))
			.responseDecodable(of: Events1.self, decoder: decoder) { response in
				debugPrint(response)
				switch response.result {
				case .success:
					events = response.value
					continuation.resume()
				case .failure:
					continuation.resume()
				}
			}
		}
		return events
	}
	
	func sendEvents(numberTake: Int) async throws -> Events1? {
		guard let url = URL(string: self.baseUrl + "events/CurrentAndFutureEvents") else {return nil}
		
		let parameters: Parameters = [
			"order": "DESC",
			"page": "1",
			"take": "\(numberTake)"
		]
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
		
		var events: Events1?
		
		try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
			AF.request(url, method: .get,
					   parameters: parameters,
					   encoding: URLEncoding(destination: .queryString))
			.responseDecodable(of: Events1.self, decoder: decoder) { response in
				debugPrint(response)
				switch response.result {
				case .success:
					events = response.value
					continuation.resume()
				case .failure:
					continuation.resume()
				}
			}
		}
		return events
	}
	
	func sendDataProfile() async throws -> ProfileData? {
		if let uid = firebaseAuth.getUserID() {
			guard let url = URL(string: self.baseUrl + "users/id/\(uid)") else {return nil}
			
			var profileData: ProfileData?
			
			try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
				AF.request(url, method: .get).responseDecodable(of: ProfileData.self) { response in
					debugPrint(response)
					switch response.result {
					case .success:
						profileData = response.value
						continuation.resume()
					case .failure:
						continuation.resume()
					}
				}
			}
			return profileData
		} else {
			return nil
		}
	}
	
	func sendSpecificEvent(idEvent: Int) async throws ->SpecificEvent? {
		if let uid = firebaseAuth.getUserID() {
			guard let url = URL(string: self.baseUrl + "events/id/\(idEvent)") else {return nil}
			
			let parameters: Parameters = [
				"firebaseUID": "\(uid)"
			]
			
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
			
			var specificEvent: SpecificEvent?
			
			try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
				AF.request(url, method: .get,
						   parameters: parameters,
						   encoding: URLEncoding(destination: .queryString))
				.responseDecodable(of: SpecificEvent.self, decoder: decoder) { response in
					debugPrint(response)
					switch response.result {
					case .success:
						specificEvent = response.value
						continuation.resume()
					case .failure:
						continuation.resume()
					}
				}
			}
			return specificEvent
		} else {
			return nil
		}
	}
	
	func signUpForEvent(idEvent: Int) async throws -> SignUpEvent? {
		if let uid = firebaseAuth.getUserID() {
			guard let url = URL(string: self.baseUrl + "events/id/\(idEvent)/signToEvent") else {return nil}
			
			let parameters: Parameters = [
				"firebaseUID": "\(uid)"
			]
			var signUpEvent: SignUpEvent?
			
			try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
				AF.request(url, method: .post,
						   parameters: parameters,
						   encoding: URLEncoding(destination: .queryString))
				.responseDecodable(of: SignUpEvent.self) { response in
					debugPrint(response)
					switch response.result {
					case .success:
						signUpEvent = response.value
						continuation.resume()
					case .failure:
						continuation.resume()
					}
				}
			}
			return signUpEvent
		} else {
			return nil
		}
	}
	
	func sendServerCode(idEvent: Int, code: String) async throws -> SignUpEvent? {
		if let uid = firebaseAuth.getUserID() {
			guard let url = URL(string: self.baseUrl + "events/id/\(idEvent)/eventConfirmation") else {return nil}
			
			let parameters: Parameters = [
				"firebaseUID": "\(uid)",
				"code": "\(code)"
			]
			
			var signUpEvent: SignUpEvent?
			
			try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
				AF.request(url, method: .post,
						   parameters: parameters,
						   encoding: URLEncoding(destination: .queryString))
				.responseDecodable(of: SignUpEvent.self) { response in
					debugPrint(response)
					switch response.result {
					case .success:
						signUpEvent = response.value
						continuation.resume()
					case .failure:
						continuation.resume()
					}
				}
			}
			return signUpEvent
		} else {
			return nil
		}
	}
	
	func sendRecordedEvents() async throws -> Events1? {
		if let uid = firebaseAuth.getUserID() {
			guard let url = URL(string: self.baseUrl + "events/FutureSigned/userId") else {return nil}
			
			let parameters: Parameters = [
				"firebaseUID": "\(uid)"
			]
			
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
			
			var recordedEvents: Events1?
			
			try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
				AF.request(url, method: .get,
						   parameters: parameters,
						   encoding: URLEncoding(destination: .queryString))
				.responseDecodable(of: Events1.self, decoder: decoder) { response in
					debugPrint(response)
					switch response.result {
					case .success:
						recordedEvents = response.value
						continuation.resume()
					case .failure:
						continuation.resume()
					}
				}
			}
			return recordedEvents
		} else {
			return nil
		}
	}
	
	func sendVisitedEvents() async throws -> Events1? {
		if let uid = firebaseAuth.getUserID() {
			guard let url = URL(string: self.baseUrl + "events/visited/userId") else {return nil}
			
			let parameters: Parameters = [
				"firebaseUID": "\(uid)"
			]
			
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
			
			var visitedEvents: Events1?
			
			try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
				AF.request(url, method: .get,
						   parameters: parameters,
						   encoding: URLEncoding(destination: .queryString))
				.responseDecodable(of: Events1.self, decoder: decoder) { response in
					debugPrint(response)
					switch response.result {
					case .success:
						visitedEvents = response.value
						continuation.resume()
					case .failure:
						continuation.resume()
					}
				}
			}
			return visitedEvents
		} else {
			return nil
		}
	}
	
	func updateInfoPerson(person: PersonData) async throws -> String {
		if let uid = firebaseAuth.getUserID() {
			guard let url = URL(string: self.baseUrl + "users/id/\(uid)/update") else {return ""}
			
			var stringAlert = ""
			
			try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
				AF.request(url, method: .post,
						   parameters: person,
						   encoder: JSONParameterEncoder.default)
				.response { response in
					debugPrint(response)
					switch response.result {
					case .success:
						stringAlert = "Данные успешно обновлены"
						continuation.resume()
					case .failure:
						stringAlert = "Ошибка, попробуйте позже"
						continuation.resume()
					}
				}
			}
			return stringAlert
		} else {
			return ""
		}
	}
	
	func sendNews(numberTake: Int) async throws -> News? {
		guard let url = URL(string: self.baseUrl + "news/all") else {return nil}
		
		let parameters: Parameters = [
			"order": "DESC",
			"page": "1",
			"take": "\(numberTake)"
		]
		
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
		
		var newsEvent: News?
		
		try await withUnsafeThrowingContinuation { (continuation: UnsafeContinuation<Void, Error>) in
			AF.request(url, method: .get,
					   parameters: parameters,
					   encoding: URLEncoding(destination: .queryString))
			.responseDecodable(of: News.self, decoder: decoder) { response in
				debugPrint(response)
				switch response.result {
				case .success:
					newsEvent = response.value
					continuation.resume()
				case .failure:
					continuation.resume()
				}
			}
		}
		return newsEvent
	}
}

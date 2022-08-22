import Foundation
struct Event: Identifiable, Decodable {
  var id: Int
  var title: String
  var availableSpaces: Int
  var presetSpaces: Int
  var startDate: Date
  var endDate: Date
  var description: String
  var image: String
  var shortAddress: String
  var address: String
  var tags: String
  var bonuses: Int
}

struct Meta: Decodable {
    var page: Int
    var take: Int
    var itemCount: Int
    var pageCount: Int
    var hasPreviousPage: Bool
    var hasNextPage: Bool
}

struct Events1: Decodable {
    var data: [Event]
    var meta: Meta
}

struct SpecificEvent: Decodable {
  var eventId: Int?
  var userId: Int?
  var isPresent: Bool?
  var accessCode: String?
  var currentTime: String
  var anonymousUser: Bool
  var event: Event
}

struct SignUpEvent: Decodable {
  var eventId: Int?
  var userId: Int?
  var isPresent: Bool
  var accessCode: String
}



var event = [
  Event(id: 1, title: "Aboba", availableSpaces: 10, presetSpaces: 10, startDate: Date(),
        endDate: Date(), description: "Aboba", image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        shortAddress: "aboba", address: "street aboba", tags: "Онлайн", bonuses: 0),
  Event(id: 2, title: "Aboba", availableSpaces: 10, presetSpaces: 10, startDate: Date(),
        endDate: Date(), description: "Aboba", image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        shortAddress: "aboba", address: "street aboba", tags: "Онлайн", bonuses: 0),
  Event(id: 3, title: "Aboba", availableSpaces: 10, presetSpaces: 10, startDate: Date(),
        endDate: Date(), description: "Aboba", image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        shortAddress: "aboba", address: "street aboba", tags: "Онлайн", bonuses: 0),
  Event(id: 4, title: "Aboba", availableSpaces: 10, presetSpaces: 10, startDate: Date(),
        endDate: Date(), description: "Aboba", image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        shortAddress: "aboba", address: "street aboba", tags: "Онлайн", bonuses: 0)
]

var recordedEvent = [
  Event(id: 1, title: "Aboba", availableSpaces: 10, presetSpaces: 10, startDate: Date(),
        endDate: Date(), description: "Aboba", image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        shortAddress: "aboba", address: "street aboba", tags: "Онлайн", bonuses: 0)
]

var visitedEvent = [
  Event(id: 1, title: "Aboba", availableSpaces: 10, presetSpaces: 10, startDate: Date(),
        endDate: Date(), description: "Aboba", image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        shortAddress: "aboba", address: "street aboba", tags: "Онлайн", bonuses: 0)
]


var specificEventData = SpecificEvent(eventId: 1, userId: 1, isPresent: false, accessCode: "1234", currentTime: "123", anonymousUser: true, event: event[0])

var signUpEventData = SignUpEvent(eventId: 1, userId: 1, isPresent: false, accessCode: "1234")

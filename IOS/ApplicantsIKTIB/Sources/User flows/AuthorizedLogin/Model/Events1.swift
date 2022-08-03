import Foundation

struct Event: Identifiable, Decodable {
  var id: Int
  var image: String
  var title: String
  var date: String
  var place: String
  var tag: String
  var money: Int
}


struct Events1: Decodable {
    var data: [Event]
    var meta: Meta
}

var event = [ 1,2
//    Event(id: 1, title: "123", availableSpaces: 2, startDate: "12344", endDate: "12dgf", description: "dfgs", image: "aboba", shortAddress: "dffd", address: "adfg"),
//    Event(id: 1, title: "123", availableSpaces: 2, startDate: "12344", endDate: "12dgf", description: "dfgs", image: "aboba", shortAddress: "dffd", address: "adfg"),
//    Event(id: 1, title: "123", availableSpaces: 2, startDate: "12344", endDate: "12dgf", description: "dfgs", image: "aboba", shortAddress: "dffd", address: "adfg"),
//    Event(id: 1, title: "123", availableSpaces: 2, startDate: "12344", endDate: "12dgf", description: "dfgs", image: "aboba", shortAddress: "dffd", address: "adfg"),
//    Event(id: 1, title: "123", availableSpaces: 2, startDate: "12344", endDate: "12dgf", description: "dfgs", image: "aboba", shortAddress: "dffd", address: "adfg"),
//    Event(id: 1, title: "123", availableSpaces: 2, startDate: "12344", endDate: "12dgf", description: "dfgs", image: "aboba", shortAddress: "dffd", address: "adfg")
]


var upcomingEvents = [
  Event(id: 1, image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        title: "Выпускной ИКТИБ", date: "Ср, 22 июня · 12:00 – 15:00", place: "Клуб «Студенческий», Чехова 76", tag: "Встреча" ,money: 2),
  Event(id: 1, image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        title: "Выпускной ИКТИБ", date: "Ср, 22 июня · 12:00 – 15:00", place: "Клуб «Студенческий», Чехова 76", tag: "Встреча", money: 2),
  Event(id: 1, image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        title: "Выпускной ИКТИБ", date: "Ср, 22 июня · 12:00 – 15:00", place: "Клуб «Студенческий», Чехова 76", tag: "Встреча", money: 2),
  Event(id: 1, image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        title: "Выпускной ИКТИБ", date: "Ср, 22 июня · 12:00 – 15:00", place: "Клуб «Студенческий», Чехова 76", tag: "Встреча", money: 2)
]


var commonEvents = [
  Event(id: 1, image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        title: "Выпускной ИКТИБ", date: "Ср, 22 июня · 12:00 – 15:00", place: "Клуб «Студенческий», Чехова 76", tag: "Встреча" ,money: 2),
  Event(id: 1, image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        title: "Выпускной ИКТИБ", date: "Ср, 22 июня · 12:00 – 15:00", place: "Клуб «Студенческий», Чехова 76", tag: "Встреча", money: 2),
  Event(id: 1, image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        title: "Выпускной ИКТИБ", date: "Ср, 22 июня · 12:00 – 15:00", place: "Клуб «Студенческий», Чехова 76", tag: "Встреча", money: 2),
  Event(id: 1, image: "https://klike.net/uploads/posts/2020-06/1591254382_2.jpg",
        title: "Выпускной ИКТИБ", date: "Ср, 22 июня · 12:00 – 15:00", place: "Клуб «Студенческий», Чехова 76", tag: "Встреча", money: 2)
]

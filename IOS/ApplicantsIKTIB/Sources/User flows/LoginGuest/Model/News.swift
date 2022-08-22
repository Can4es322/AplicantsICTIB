import Foundation

struct News: Decodable {
    var data: [New]
    var meta: Meta
}

struct New: Identifiable, Decodable {
  var id: Int
  var title: String
  var subTitle: String
  var image: String
  var createdAt: Date
  var description: String
}

var news1 = [
  New(id: 1, title: "", subTitle: "", image: "", createdAt: Date(), description: ""),
  New(id: 1, title: "", subTitle: "", image: "", createdAt: Date(), description: "")
]

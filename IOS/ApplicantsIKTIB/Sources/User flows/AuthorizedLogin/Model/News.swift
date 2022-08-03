struct News: Decodable {
    var data: [New]
    var meta: Meta
}

struct New: Identifiable, Decodable {
    var id: Int
    var title: String
    var image: String
    var createdAt: String
    var description: String
}

struct Meta: Decodable {
    var page: Int
    var take: Int
    var itemCount: Int
    var pageCount: Int
    var hasPreviousPage: Bool
    var hasNextPage: Bool
}

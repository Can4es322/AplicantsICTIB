struct ProfileData: Decodable {
  var birthDate: String
  var createdAt: String
  var email: String?
  var emailVerified: Bool
  var firstName: String
  var middleName: String?
  var id: Int
  var image: String?
  var lastName: String
  var phoneNumber: String
  var updatedAt: String
  var school: String
  var city: String
  var bonuses: Int
}


var profile = ProfileData(birthDate: "11.11.2001", createdAt: "", emailVerified: true,
                          firstName: "Aboba", id: 1, lastName: "Aboba", phoneNumber: "5553535",
                          updatedAt: "", school: "", city: "", bonuses: 3)

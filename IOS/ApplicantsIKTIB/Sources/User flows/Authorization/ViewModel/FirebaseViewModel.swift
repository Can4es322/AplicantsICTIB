import FirebaseAuth

class FirebaseViewModel: ObservableObject {
    @Published var phoneNumber = "1"
    @Published var errorMsg = ""
    @Published var id: String?
    @Published var token: String?
    @Published var correctPhone = false

    func verifyUser() async throws {
        // Удалить при тестировании на телефоне
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true

        self.id = try await PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil)
        print(self.id ?? "empty")

//        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (UUID, err)  in
//            if err != nil {
//                self.errorMsg = err!.localizedDescription
//                print(self.errorMsg)
//                return
//            }
//            self.id = UUID
//            self.correctPhone = true
//        }
//        if let id = self.id {
//            print(id)
//        } else {
//          print("id = nil")
//        }
    }

    func authCodeRegistration(UUID: String?, code: String) async throws {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: UUID ?? "", verificationCode: code)

        if UUID == nil {
            print("UUID = nil")
        } else {
            print("OK")
            print(UUID!)
        }
        try await Auth.auth().signIn(with: credential)

        let currentUser = Auth.auth().currentUser
        let token1 = try await currentUser?.getIDToken()
        print(token1 ?? "token empty")
//        Auth.auth().signIn(with: credential) { (_, err) in
//
//            let currentUser = Auth.auth().currentUser
//
//            if let error = err {
//                print(error)
//                self.errorMsg = err!.localizedDescription
//                self.agreeCode = false
//                return
//            } else {
//                self.agreeCode = true
//                print(self.agreeCode)
//                 currentUser?.getIDTokenForcingRefresh(true) {idToken, error in
//                     if error != nil {
//                        print("Error token")
//                        return
//                    }
//                    self.token = idToken
//                }
//            }
//        }
    }
}

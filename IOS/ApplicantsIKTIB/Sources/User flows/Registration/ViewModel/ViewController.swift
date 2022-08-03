import Alamofire

class ViewController: ObservableObject {

    @Published var person = PersonData(
        name: "",
        lastName: "",
        birthday: "",
        middleName: "",
        school: "",
        city: "",
        email: ""
    )
    @Published var isSuccesLogin = false
    @Published var isSuccesReg = false
    @Published var newsSmall: News?
    @Published var newsBig: News?
    //@Published var events: Events?

    func checkPersonData() -> Bool {
        return person.lastName == "" || person.name == "" || person.middleName == ""
        || person.birthday == "" || person.city == "" || person.school == "" ? true : false
    }

    var take = 4
    private let baseUrl = "http://26.120.212.37:3000/"

    func sendData(idToken: String?) {
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

        AF.request(url, method: .post,
                   parameters: person,
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response { response in
                debugPrint(response)

            switch response.result {
            case .success:
                    self.isSuccesReg = true
            case .failure:
                    self.isSuccesLogin = false
                }

            }
        }

    func sendDataLogin(idToken: String?) {
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

            AF.request(url, method: .post, headers: headers).validate(statusCode: 200..<300)
             .response { response in
                debugPrint(response)
                    switch response.result {
                    case .success:
                        self.isSuccesLogin = true
                            return

                    case .failure:
                            self.isSuccesLogin = false
                            return
                    }
                }
        }

    func sendSmallNews(numberTake: Int) {
        guard let url = URL(string: self.baseUrl + "news/false") else {return}

        let parameters: Parameters = [
            "order": "DESC",
            "page": "1",
            "take": "\(numberTake)"
        ]

//        try await withUnsafeThrowingContinuation{ (continuation: UnsafeContinuation<Void,Error>) in
            AF.request(url, method: .get,
                       parameters: parameters,
                       encoding: URLEncoding(destination: .queryString)).responseDecodable(of: News.self) { response in
                    debugPrint(response)

                switch response.result {
                case .success:
                    self.newsSmall = response.value
                   // continuation.resume()
                case .failure: break

                }

            }
        }

    func sendBigNews(numberTake: Int) {
        guard let url = URL(string: self.baseUrl + "news/true") else {return}

        let parameters: Parameters = [
            "order": "DESC",
            "page": "1",
            "take": "\(numberTake)"
        ]

//        try await withUnsafeThrowingContinuation{ (continuation: UnsafeContinuation<Void,Error>) in
            AF.request(url, method: .get,
                       parameters: parameters,
                       encoding: URLEncoding(destination: .queryString)).responseDecodable(of: News.self) { response in
                    debugPrint(response)

                switch response.result {
                case .success:
                    self.newsBig = response.value
                   // continuation.resume()
                case .failure: break

                }
            }
        }

    func sendEvents(numberTake: Int) {
        guard let url = URL(string: self.baseUrl + "events") else {return}

        let parameters: Parameters = [
            "order": "DESC",
            "page": "1",
            "take": "\(numberTake)"
        ]

//        try await withUnsafeThrowingContinuation{ (continuation: UnsafeContinuation<Void,Error>) in
//            AF.request(url, method: .get,
//                       parameters: parameters,
//                       encoding: URLEncoding(destination: .queryString))
//            .responseDecodable(of: Events.self) { response in
//                    debugPrint(response)
//
//                switch response.result {
//                case .success:
//                    self.events = response.value
//                   // continuation.resume()
//                case .failure: break
//
//                }
//            }
        }

    func loadMoreContentEvents() {
//        if self.events?.meta.page ?? 1 < self.events?.meta.pageCount ?? 1 {
//            take += 5
//            self.sendEvents(numberTake: take)
//        }
    }

    func loadMoreContentBigNews() {
        if self.newsBig?.meta.page ?? 1 < self.newsBig?.meta.pageCount ?? 1 {
            take += 2
            self.sendBigNews(numberTake: take)
        }
    }

    func loadMoreContentSmallNews() {
        if self.newsSmall?.meta.page ?? 1 < self.newsSmall?.meta.pageCount ?? 1 {
            take += 4
            self.sendSmallNews(numberTake: take)
        }
    }

}

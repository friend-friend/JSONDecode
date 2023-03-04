import Foundation

let urlRequest = UrlRequest()

var components = URLComponents()
components.scheme = "https"
components.host = "api.magicthegathering.io"
components.path = "/v1/cards"
components.queryItems = [URLQueryItem(name: "name", value: "\"Opt\"")]

let opt = components.string ?? ""
DispatchQueue.global().async {
    urlRequest.getData(urlRequest: opt) { result in
        guard result != nil else { return }

        print("Список карт категории Opt")
        urlRequest.displayCardInfo(for: result.cards)
    }
}

components.queryItems = [URLQueryItem(name: "name", value: "\"Black Lotus\"")]
let blackLotus = components.string ?? ""
DispatchQueue.global().async {
    urlRequest.getData(urlRequest: blackLotus) { result in
        guard result != nil else { return }
        
        print("Список карт категории Black Lotus")
        urlRequest.displayCardInfo(for: result.cards)
    }
}

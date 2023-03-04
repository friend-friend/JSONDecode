import UIKit

let urlRequest = UrlRequest()

var components = URLComponents()
components.scheme = "https"
components.host = "api.magicthegathering.io"
components.path = "/v1/cards"
components.queryItems = [
URLQueryItem(name: "name", value: "\"Opt\"")
]

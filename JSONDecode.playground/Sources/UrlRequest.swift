import Foundation

public class UrlRequest {

    public init() {}

    func getData(urlRequest: String, mapInformation: @escaping(QueryResult) -> Void ) {
        guard let urlRequest = URL(string: urlRequest) else { return }
        print("Запрос отправлен")

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                print(NetworkError.inavalidURL.localizedDescription)
            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Ответ получен. Состояние кода - \(response.statusCode)")
                guard let data = data else {
                    return print(NetworkError.serverError.localizedDescription)
                }

                let json = try? JSONDecoder().decode(QueryResult.self, from: data)
                guard json != nil else {
                    return print(NetworkError.networkUnavailable.localizedDescription)
                }
            }
        } .resume()
    }

    func displayCardInfo(for cards: [Card]) {
        for card in cards {
            print("Имя карты: \(card.name)")
            print("Тип карты: \(card.type)")
            if let manaCost = card.manaCost {
                print("Требуется маны: \(manaCost)")
            }
            print("Название набора: \(card.setName)")
        }
    }
    
}

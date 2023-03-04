import Foundation

public class urlRequest {

    public init() {}

    func getData(urlRequest: String) {
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
                
                let dataAsString = String(data: data, encoding: .utf8)
                print(dataAsString ?? "")
            }
        } .resume()
    }
}

import Foundation

public struct QueryResult: Decodable {
    var cards: [Card]
}

public struct Card: Decodable {
    let name: String
    let manaCost: String?
    let type: String
    let setName: String
}

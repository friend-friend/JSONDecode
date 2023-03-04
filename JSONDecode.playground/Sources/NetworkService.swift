import Foundation

public struct QueryResult: Decodable {
   public var cards: [Card]
}

public struct Card: Decodable {
    let name: String
    let manaCost: String?
    let type: String
    let setName: String
}

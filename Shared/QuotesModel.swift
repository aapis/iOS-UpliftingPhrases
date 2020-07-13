//
//  Quotes.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import Foundation

struct Quote: Hashable, Codable {
    var text: String
    var author: String
    var favourite: Bool
}

class QuotesModel: ObservableObject {
    @Published var list: [Quote] = getJson("Quotes.json")
    
    public func favourites() -> [Quote] {
        return list.filter { $0.favourite == true }
    }
    
    public func all() -> [Quote] {
        return list
    }
    
    public func defaultEntry() -> Quote {
        return Quote(text: "There is no greater agony than bearing an untold story inside you.", author: "Maya Angelou", favourite: false)
    }
    
    public func random() -> Quote {
        return list.randomElement()!
    }
    
    static private func getJson<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}

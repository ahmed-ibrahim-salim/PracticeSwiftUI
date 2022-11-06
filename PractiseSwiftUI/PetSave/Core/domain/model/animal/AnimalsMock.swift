//
//  AnimalsMock.swift
//  PractiseSwiftUI
//
//  Created by magdy khalifa on 31/10/2022.
//

import Foundation


// Mocking data for Animal Model
extension Animal {
    static let mock = loadAnimals()
}

private struct AnimalsMock: Codable {
    let animals: [Animal]
}

// 2
private func loadAnimals() -> [Animal] {
    
    guard let url = Bundle.main.url(forResource: "AnimalsMock", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return [] }
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    // decoding from json file
    let jsonMock = try? decoder.decode(AnimalsMock.self, from: data)
    
    return jsonMock?.animals ?? []
}


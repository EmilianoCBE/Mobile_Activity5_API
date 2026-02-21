//
//  Pokemon.swift
//  Act03_MyFirstApp_A00824311
//
//  Created by Emiliano on 18/02/26.
//

import Foundation

struct PokeAPIResponse: Decodable {
    var results: [Pokemon]
}

struct Pokemon : Identifiable, Decodable {
    var id = UUID()
    var name: String
    var url: String
    
    var pokedexNumber: String {
        return url.components(separatedBy: "/").dropLast().last ?? "0"
    }
    
    var imageUrl: URL? {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokedexNumber).png")
    }
        
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

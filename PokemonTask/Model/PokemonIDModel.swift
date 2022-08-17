//
//  PokemonIDModel.swift
//  PokemonTask
//
//  Created by Haydar Bekmuradov on 15.08.22.
//

import Foundation

struct PokemonIdModel: Codable {
    let name: String
    let sprites: Sprites
    let height: Int
    let weight: Int
    let types: [Types]
}

struct Types: Codable {
    let type: TypesName
}

struct TypesName: Codable {
    let name: String
}

struct Sprites: Codable {
    let front_shiny: String
}

//
//  PokemonModel.swift
//  PokemonTask
//
//  Created by Haydar Bekmuradov on 15.08.22.
//

import Foundation

// MARK: - PokemonModel
struct PokemonModel: Codable {
    let count: Int?
    let next: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: String
}


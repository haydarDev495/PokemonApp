//
//  ListModel.swift
//  PokemonTask
//
//  Created by Haydar Bekmuradov on 18.08.22.
//

import Foundation
import RealmSwift

class ListModel: Object {
    @Persisted var list: [String] = []

}

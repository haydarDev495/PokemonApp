//
//  ListViewModel.swift
//  PokemonTask
//
//  Created by Haydar Bekmuradov on 15.08.22.
//

import Foundation

protocol ListDelegate {
    func updateUI()
}

final class ListViewModel {
    var delegate: ListDelegate!
    var pokemonsName: [String] = []
    var pokemonsID: [String] = []
    private var next = ""

    init() {
        fetchPokemonsList()
    }

    private func fetchPokemonsList() {
        guard let url = URL(string: "\(Constant.domain)\(Constant.apiVersion)\(Constant.pokemon)")
        else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async { [self] in
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(PokemonModel.self, from: data)
                    
                    for i in json.results {
                        pokemonsName.append(i.name)
                        pokemonsID.append(i.url)
                    }
                    
                    next = json.next
                    self.delegate.updateUI()
                } catch {
                    return
                }
            }
        }.resume()
    }

    func fetchNextPokemonsList() {
        guard let url = URL(string: next) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async { [self] in
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(NextModel.self, from: data)
                    
                    for i in json.results {
                        pokemonsName.append(i.name)
                        pokemonsID.append(i.url)
                    }

                    next = json.next
                    self.delegate.updateUI()
                } catch {
                    return
                }
            }
        }.resume()
    }
}

//
//  ListVC + TableView.swift
//  PokemonTask
//
//  Created by Haydar Bekmuradov on 15.08.22.
//

import UIKit

// MARK: TBV Data Source

extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonsName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name: \(viewModel.pokemonsName[indexPath.row].capitalized)"
        return cell
    }
}

// MARK: TBV Delegate

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetail", sender: viewModel.pokemonsID[indexPath.row])

    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.pokemonsName.count - 1 {
            viewModel.fetchNextPokemonsList()
        }
    }
}

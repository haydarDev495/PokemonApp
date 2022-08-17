//
//  ListVC.swift
//  PokemonTask
//
//  Created by Haydar Bekmuradov on 15.08.22.
//

import UIKit

class ListVC: UIViewController, ListDelegate {
    @IBOutlet var tableView: UITableView!
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9484171271, green: 0.9503105283, blue: 0.967944324, alpha: 1)
        
        title = "Pokemon's List"
    }
    func updateUI() {
        self.tableView.reloadData()
    }

    private func setupUI() {
        viewModel.delegate = self

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailVC,
           let pokemonId = sender as? String {
            vc.pokemonId = pokemonId
        }
    }
}

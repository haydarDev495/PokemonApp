//
//  DetailVC.swift
//  PokemonTask
//
//  Created by Haydar Bekmuradov on 15.08.22.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
        
    var pokemonId = ""
    private var pokemonInfo: PokemonInfoMode?
    private var type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokemonsUrl()
        setupNC()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
    }
  
    func fetchPokemonsUrl() {
        guard let url = URL(string: pokemonId) else { print("ddd"); return }
    
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async { [self] in
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(PokemonIdModel.self, from: data)

                    for i in json.types {
                        type = i.type.name
                    }
                    
                    pokemonInfo = PokemonInfoMode(name: json.name,
                                        image: json.sprites.front_shiny,
                                        height: json.height,
                                        weight: json.weight)
                } catch {
                    return
                }
            }
        }.resume()
    }

    private func setupUI() {
        if let name = pokemonInfo?.name.capitalized,
           let image = pokemonInfo?.image,
           let height = (pokemonInfo?.height),
           let weight = (pokemonInfo?.weight)
        {
            nameLabel.text = "Name is: \(name)"
            imageView.downloaded(from: image)
            heightLabel.text = "Height is: \(height)"
            weightLabel.text = "Weight is: \(weight)"
            typeLabel.text = "Type is: \(type)"
        }
        
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.cornerRadius = 50
    }
    
    private func setupNC() {
        title = "Info"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.backItem?.title = "Back"
    }
}


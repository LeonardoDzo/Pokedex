//
//  PokemonsTableViewController.swift
//  Pokedex
//
//  Created by Leonardo Durazo on 3/2/19.
//  Copyright © 2019 Leonardo Durazo. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonsTableViewController: UITableViewController {
    let client = NetworkProvider.shared.apollo
    var pokemons = [PokemonsQuery.Data.Pokemon?]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    var noMorePokemons = false
    var lastIndex = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        let pokemon = pokemons[indexPath.row]
        cell.bind(pokemon)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let isReachingEnd = scrollView.contentOffset.y >= 0
            && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
        if isReachingEnd, !noMorePokemons {
            loadPokemons(lastIndex)
        }
    }
    
    func loadPokemons(_ first: Int) {
        client?.fetch(query: PokemonsQuery(first: first)) { result, error in
            if let pokemons = result?.data?.pokemons {
                if self.pokemons.isEmpty {
                    self.pokemons = pokemons
                } else {
                    self.noMorePokemons = pokemons.count > 150
                    let pokemonsToAdd = pokemons.suffix(from: self.pokemons.count)
                    self.pokemons.append(contentsOf: pokemonsToAdd)
                }
                self.lastIndex += 30
            }
        }
    }
}

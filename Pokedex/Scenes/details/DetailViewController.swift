//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Leonardo Durazo on 3/11/19.
//  Copyright © 2019 Leonardo Durazo. All rights reserved.
//

import UIKit
import Apollo
class DetailViewController: UIViewController {
    var evolutions = [PokemonQuery.Data.Pokemon.Evolution]()  {
        didSet {
            if (evolutions.isEmpty) {
                let lbl = UILabel()
                lbl.text = "Este pokemon no tiene evoluciones"
                lbl.textAlignment = .center
                self.tableView.backgroundView = lbl
            } else  {
               self.tableView.reloadData()
               self.tableView.backgroundView = nil
            }
        }
    }
    private var tableView: UITableView!
    private let apollo = NetworkProvider.shared.apollo
    private let closeBtn = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
    private let customView = DetailView()
    private var name: String = ""
    private var isPresent: Bool = false
    
    convenience init(_ name: String, isPresent: Bool = true) {
        self.init(nibName: nil, bundle: nil)
        self.name = name
        self.isPresent = isPresent
    }
    
    fileprivate func initController() {
        self.tableView = customView.evolutionsTableView
        tableView.dataSource = self
        tableView.delegate = self
        self.view = customView
        closeBtn.target = self
        closeBtn.action = #selector(self.closeVc)
        if isPresent {
            self.navigationItem.leftBarButtonItem = closeBtn
        }
        fetchInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initController()
    }
    override func loadView() {
        self.view = customView
    }
    override func viewWillAppear(_ animated: Bool) {
        loadView()
    }
    @objc func closeVc(){
        self.dismiss(animated: true, completion: nil)
    }
    func fetchInfo() {
        apollo?.fetch(query: PokemonQuery(name: self.name)) { result, error in
            if let pokemon = result?.data?.pokemon {
                self.customView.bind(pokemon)
                self.evolutions = pokemon.evolutions as? [PokemonQuery.Data.Pokemon.Evolution] ?? []
            }
        }
    }
}
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return evolutions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        let pokemon = evolutions[indexPath.row]
        cell.bind(pokemon.fragments)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemonName = evolutions[indexPath.row].fragments.pokemonDetails.name
        self.navigationController?.pushViewController(DetailViewController(pokemonName!, isPresent: false), animated: true)
    }
}

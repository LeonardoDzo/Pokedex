//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Leonardo Durazo on 3/2/19.
//  Copyright © 2019 Leonardo Durazo. All rights reserved.
//

import UIKit
import Kingfisher
import Stevia

class PokemonTableViewCell: UITableViewCell {
    
    var nameLbl: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont.preferredFont(forTextStyle: .headline)
        lbl.numberOfLines = 0
        return lbl
    }()
//    var classificationLbl: UILabel = {
//        var lbl = UILabel()
//        lbl.font = UIFont.preferredFont(forTextStyle: .headline)
//        lbl.numberOfLines = 0
//        return lbl
//    }()
    var icon: UIImageView = {
        var img = UIImageView()
        let path = Bundle.main.path(forResource: "pokeballLoading", ofType: "gif")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        img.contentMode = .scaleAspectFit
        img.kf.indicatorType = .image(imageData: data)
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        sv (icon, nameLbl)
        
        layout(
            >=16,
            |-icon.size(60).centerVertically()-nameLbl.centerVertically()-|,
            ""
        )
    }
    
    func bind(_ pokemon: PokemonsQuery.Data.Pokemon?) {
        nameLbl.text = pokemon?.name
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        icon.kf.setImage(with: URL(string: pokemon?.image ?? ""), options: [.transition(.fade(0.4)), .processor(processor)])
        //classificationLbl.text = pokemon?.classification
    }
    
    func bind(_ pokemon: PokemonQuery.Data.Pokemon.Evolution.Fragments) {
        nameLbl.text = pokemon.pokemonDetails.name
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        icon.kf.setImage(with: URL(string: pokemon.pokemonDetails.image ?? ""), options: [.transition(.fade(0.4)), .processor(processor)])
    }
    
}

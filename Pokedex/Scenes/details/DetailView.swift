//
//  DetailView.swift
//  Pokedex
//
//  Created by Leonardo Durazo on 3/11/19.
//  Copyright © 2019 Leonardo Durazo. All rights reserved.
//

import Stevia
import UIKit
import Kingfisher

final class DetailView: UIView {
    
    let iconView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)
        lbl.layer.cornerRadius = 8
        lbl.clipsToBounds = true
        lbl.font = UIFont.preferredFont(forTextStyle: .headline)
            .withSize(UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
        return lbl
    }()
    let subtitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Evoluciones"
        lbl.font = UIFont.preferredFont(forTextStyle: .headline)
        return lbl
    }()
    var evolutionsTableView: UITableView = {
        var table = UITableView()
        table.register(PokemonTableViewCell.self, forCellReuseIdentifier: "cell")
        table.tableFooterView = UIView()
        return table
    }()
    
    convenience init() {
        self.init(frame: .zero)
        render()
        backgroundColor = UIColor.white
    }
    
    func render() {
        sv(iconView,
           titleLbl,
           subtitleLbl,
           evolutionsTableView)
        
        iconView.top(0)
            .height(40%)
            .width(100%)
        
        layout(
            |-titleLbl.top(40%)-|,
            10,
            |-subtitleLbl-|,
            10,
            |evolutionsTableView|,
            10
        )
    }
    
    func bind(_ model: PokemonQuery.Data.Pokemon) {
        self.titleLbl.text = "\(model.fragments.pokemonDetails.number ?? "")- \(model.fragments.pokemonDetails.name ?? "")"
        self.iconView.kf.setImage(with: URL(string: model.fragments.pokemonDetails.image ?? ""), options: [.transition(.fade(0.4))])
    }
    
}

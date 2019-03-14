//
//  Application.swift
//  Pokedex
//
//  Created by Leonardo Durazo on 3/2/19.
//  Copyright © 2019 Leonardo Durazo. All rights reserved.
//

import UIKit

class Application {
    static let shared = Application()
    
    func configureMainInterface(in window: UIWindow) {
        let pnc = UINavigationController(rootViewController: PokemonsTableViewController())
        let nb = pnc.navigationBar
        nb.tintColor = #colorLiteral(red: 1, green: 0.2401054468, blue: 0.2534727312, alpha: 1)
        nb.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        window.rootViewController = pnc
    }

}

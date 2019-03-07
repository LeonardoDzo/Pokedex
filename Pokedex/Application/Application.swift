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
        window.rootViewController = PokemonsTableViewController()
    }

}

//
//  ApolloClient.swift
//  Pokedex
//
//  Created by Leonardo Durazo on 3/2/19.
//  Copyright © 2019 Leonardo Durazo. All rights reserved.
//

import Foundation
import Apollo

class ApolloClient {
    let apollo: ApolloClient!
    static let shared = ApolloClient()
    
    private init() {
        apollo = ApolloClient(url: URL(string: "https://graphql-pokemon.now.sh/"))
    }
}

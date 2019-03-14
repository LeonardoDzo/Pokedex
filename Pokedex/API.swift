//  This file was automatically generated and should not be edited.

import Apollo

public final class PokemonQuery: GraphQLQuery {
  public let operationDefinition =
    "query Pokemon($name: String!) {\n  pokemon(name: $name) {\n    __typename\n    ...PokemonDetails\n    evolutions {\n      __typename\n      ...PokemonDetails\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(PokemonDetails.fragmentDefinition) }

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("pokemon", arguments: ["name": GraphQLVariable("name")], type: .object(Pokemon.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemon: Pokemon? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "pokemon": pokemon.flatMap { (value: Pokemon) -> ResultMap in value.resultMap }])
    }

    public var pokemon: Pokemon? {
      get {
        return (resultMap["pokemon"] as? ResultMap).flatMap { Pokemon(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "pokemon")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes = ["Pokemon"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(PokemonDetails.self),
        GraphQLField("evolutions", type: .list(.object(Evolution.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The evolutions of this Pokémon
      public var evolutions: [Evolution?]? {
        get {
          return (resultMap["evolutions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Evolution?] in value.map { (value: ResultMap?) -> Evolution? in value.flatMap { (value: ResultMap) -> Evolution in Evolution(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Evolution?]) -> [ResultMap?] in value.map { (value: Evolution?) -> ResultMap? in value.flatMap { (value: Evolution) -> ResultMap in value.resultMap } } }, forKey: "evolutions")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var pokemonDetails: PokemonDetails {
          get {
            return PokemonDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Evolution: GraphQLSelectionSet {
        public static let possibleTypes = ["Pokemon"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(PokemonDetails.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, number: String? = nil, name: String? = nil, image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Pokemon", "id": id, "number": number, "name": name, "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var pokemonDetails: PokemonDetails {
            get {
              return PokemonDetails(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class PokemonsQuery: GraphQLQuery {
  public let operationDefinition =
    "query Pokemons($first: Int!) {\n  pokemons(first: $first) {\n    __typename\n    id\n    number\n    name\n    image\n    classification\n  }\n}"

  public var first: Int

  public init(first: Int) {
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("pokemons", arguments: ["first": GraphQLVariable("first")], type: .list(.object(Pokemon.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pokemons: [Pokemon?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "pokemons": pokemons.flatMap { (value: [Pokemon?]) -> [ResultMap?] in value.map { (value: Pokemon?) -> ResultMap? in value.flatMap { (value: Pokemon) -> ResultMap in value.resultMap } } }])
    }

    public var pokemons: [Pokemon?]? {
      get {
        return (resultMap["pokemons"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Pokemon?] in value.map { (value: ResultMap?) -> Pokemon? in value.flatMap { (value: ResultMap) -> Pokemon in Pokemon(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Pokemon?]) -> [ResultMap?] in value.map { (value: Pokemon?) -> ResultMap? in value.flatMap { (value: Pokemon) -> ResultMap in value.resultMap } } }, forKey: "pokemons")
      }
    }

    public struct Pokemon: GraphQLSelectionSet {
      public static let possibleTypes = ["Pokemon"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("number", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("classification", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, number: String? = nil, name: String? = nil, image: String? = nil, classification: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Pokemon", "id": id, "number": number, "name": name, "image": image, "classification": classification])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The ID of an object
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The identifier of this Pokémon
      public var number: String? {
        get {
          return resultMap["number"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "number")
        }
      }

      /// The name of this Pokémon
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      /// The classification of this Pokémon
      public var classification: String? {
        get {
          return resultMap["classification"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "classification")
        }
      }
    }
  }
}

public struct PokemonDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment PokemonDetails on Pokemon {\n  __typename\n  id\n  number\n  name\n  image\n}"

  public static let possibleTypes = ["Pokemon"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("number", type: .scalar(String.self)),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("image", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, number: String? = nil, name: String? = nil, image: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Pokemon", "id": id, "number": number, "name": name, "image": image])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The ID of an object
  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// The identifier of this Pokémon
  public var number: String? {
    get {
      return resultMap["number"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "number")
    }
  }

  /// The name of this Pokémon
  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var image: String? {
    get {
      return resultMap["image"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "image")
    }
  }
}
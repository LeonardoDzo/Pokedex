//
//  LaunchViewController.swift
//  Pokedex
//
//  Created by Leonardo Durazo on 3/2/19.
//  Copyright © 2019 Leonardo Durazo. All rights reserved.
//

import UIKit
import Lottie
class LaunchViewController: UIViewController {

    @IBOutlet weak var lotieView: LOTAnimationView! {
        didSet {
            lotieView.animation = "launch"
            lotieView.play { (isDone) in
                if isDone {
                    self.present(PokemonsTableViewController(), animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

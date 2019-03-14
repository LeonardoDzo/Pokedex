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
                    let pnc = UINavigationController(rootViewController: PokemonsTableViewController())
                    let nb = pnc.navigationBar
                    nb.barTintColor = #colorLiteral(red: 1, green: 0.2401054468, blue: 0.2534727312, alpha: 1)
                    nb.titleTextAttributes = [.foregroundColor: UIColor.white]
                    self.present(pnc, animated: true, completion: nil)
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

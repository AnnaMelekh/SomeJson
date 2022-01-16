//
//  ViewController.swift
//  SomeJson
//
//  Created by Anna Melekhina on 16.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    @IBAction func pushButtonOne() {
//    }
//
    @IBAction func pushButtonTwo() {
    }
    
    @IBAction func pushButtonThree(_ sender: UIButton) {
    }
}



//MARK: Networking

extension MainViewController {
    private func buttonTwoPressed() {
        guard let url = URL(string: Link.secondButton.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return 
            }
            
        }.resume()
}
    
    private func buttonThreePressed() {
        guard let url = URL(string: Link.thirdButton.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
        }.resume()
    }
}

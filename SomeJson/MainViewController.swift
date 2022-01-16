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
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "button2segue" {
        let textVC = segue.destination as? TextBlockViewController
            textVC?.fetchText()
    }
    }

    
    @IBAction func pushButtonOne() {
    }

    @IBAction func pushButtonTwo() {
//        buttonTwoPressed()
    }
    
   
    @IBAction func pushButtonThree() {
        buttonThreePressed()

    }
    
// MARK: - Private Methods
private func successAlert() {
    DispatchQueue.main.async {
        let alert = UIAlertController(
            title: "Success",
            message: "You can see the results in the Debug area",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

private func failedAlert() {
    DispatchQueue.main.async {
        let alert = UIAlertController(
            title: "Failed",
            message: "You can see error in the Debug area",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
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
        
            do {
                let text = try JSONDecoder().decode(TextBlock.self, from: data)
                self.successAlert()
                print(text)
            } catch {
                self.failedAlert()
                print(error.localizedDescription)
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
            
            do {
                let text = try JSONDecoder().decode(TextBlock.self, from: data)
                self.successAlert()
                print(text)
            } catch {
                self.failedAlert()
                print(error.localizedDescription)
            }

        }.resume()
    }
    
}

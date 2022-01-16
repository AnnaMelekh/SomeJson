//
//  TextBlockViewController.swift
//  SomeJson
//
//  Created by Anna Melekhina on 17.01.2022.
//

import UIKit

class TextBlockViewController: UIViewController {
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        func configure(with textBlock: TextBlock){
            titleLabel.text = textBlock.title
            bodyLabel.text = textBlock.body
       }
    }
    
    
    

}

extension TextBlockViewController {
    func fetchText(){
        guard let url = URL(string: Link.secondButton.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
        
            do {
                let text = try JSONDecoder().decode(TextBlock.self, from: data)
                
                DispatchQueue.main.async {
                    func configure(with textBlock: TextBlock){
                        self.titleLabel.text = textBlock.title
                        self.bodyLabel.text = textBlock.body
                    }
    
                }
               
                print(text)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

//
//  ViewController.swift
//  Counter
//
//  Created by Kirill Sklyarov on 16.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "0"

    // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var keyButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func keyButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
    }
}

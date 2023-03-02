//
//  ViewController.swift
//  QuizApp
//
//  Created by Zeynep Sevgi on 2.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
           
           let score = UserDefaults.standard.string(forKey: "score") ?? "0"
           
           lblScore.text = "Last Score: \(score)"
           
       }


}


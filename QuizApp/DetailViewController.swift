//
//  DetailViewController.swift
//  QuizApp
//
//  Created by Zeynep Sevgi on 2.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    let questions = ["Atatürk'ün doğum tarihi ne zamandır?", "Gezegenler isimlerini nereden alıyor?", "Güneş sistemimizde kaç gezegen var?"]
        let answers = [["1881", "1885", "1980"], ["Yunan Tanrılarından.", "Onları keşfeden bilim adamlarından.", "Latince kelimelerden."], ["8", "9", "10"]]
        
    
    

    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnB: UIButton!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    var currentQuestion = 0
      var score = 0
      var rightAnswer:UInt32 = 0
      
      var defaults = UserDefaults.standard
      
    override func viewDidLoad() {
        super.viewDidLoad()

        btnA.layer.cornerRadius = 10
        btnB.layer.cornerRadius = 10
        btnC.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextQuestion()
    }
    

    @IBAction func buton(_ sender: Any) {
        if (sender as AnyObject).tag == Int(rightAnswer) {
                   
                   print("RIGHT!!")
                   score += 1
               }
               else {
                   print("WRONG!!!!!")
               }
               
               if currentQuestion != questions.count {
                   
                   nextQuestion()
                   
               }else {
                   defaults.set(String(score), forKey: "score")
                   defaults.synchronize()
                   self.dismiss(animated: true, completion: nil)
               }
               
       
    }
    
    func nextQuestion() {
        
        lblTitle.text = questions[currentQuestion]
               
               rightAnswer = arc4random_uniform(3) + 1
               
               var button = UIButton()
               
               var x = 1
               
        for i in 1...3 {
                   
                   button = view.viewWithTag(i) as! UIButton
                   
                   if i == Int(rightAnswer) {
                       
                       button.setTitle(answers[currentQuestion][0], for: .normal)
                       
                   }else {
                       button.setTitle(answers[currentQuestion][x], for: .normal)
                       x = 2
                   }
                   
               }
        currentQuestion += 1
        

    }
    

}

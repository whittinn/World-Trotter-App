//
//  QuizViewController.swift
//  World Trotter App
//
//  Created by Nathaniel Whittington on 8/13/21.
//

import UIKit

class QuizViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var answerLabel : UILabel!
    
    let questions : [String] = ["What is the capital of Montanta?", "Where is the U.S capital located ?", "Where is Chicago located?"]
    let answers : [String] = ["Helena", "Washington, D.C", "Illinois"]
    var currentQuestionIndex : Int = 0
    
    @IBAction func showNextQuestion(_sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        
        let question : String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
    }
    
    @IBAction func showAnswer(_sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
}

//
//  ViewController.swift
//  Quiz App
//
//  Created by singsys on 30/05/22.
//

import UIKit

class SecondViewController: UIViewController {
    var questionCount = 0
    var score = 0
    // Text View for questions
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    //Options Button
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playQuiz: UIButton!
    @IBOutlet var nextButton: UIView!
    
// Set of Questions and answers
    var setOfQuestions:[[String:Any]] = [
        [
            "question" : "Capital of India ?",
            "option" : ["Delhi", "Punjab", "Lucknow", "Haryana"],
            "answer": "Delhi"
        ],
        [
            "question" : "Language spoken in Chennai ?",
            "option" : ["Tamil", "Hindi", "English", "Urdu"],
            "answer": "Tamil"
        ],
        [
            "question" : "Who is current Prime Minister of America ?",
            "option" : ["Donald Trump", "Johnson", "Joe Biden", "Modi"],
            "answer": "Joe Biden"
        ],
        [
            "question" : "Current in Canada ?",
            "option" : ["Rupee", "Pound", "US Dollar", "Canadian Dollar"],
            "answer": "Canadian Dollar"
        ],
        [
            "question" : "National game of India ?",
            "option" : ["Cricket", "Hockey", "Football", "Kabaddi"],
            "answer": "Hockey"
        ],
        
    ]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.text = "1. All questions are multiple type. \n2. You cannot go back after submiting answer. \n3. Score will be calculated per correct answer."
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
        scoreLabel.isHidden = true
        nextButton.isHidden = true
    }

// Start Quiz button

@IBAction func playQuiz(_ sender: UIButton) {
    if sender.tag == 4 && questionCount < setOfQuestions.count{
// Options Shown
            option1.isHidden = false
            option2.isHidden = false
            option3.isHidden = false
            option4.isHidden = false
            scoreLabel.isHidden = false
            scoreLabel.text = ""
            playQuiz.isHidden = true
            label.text = "Your question"
            nextButton.isHidden = true
        
    }
            
// Fetching Questions, options and answers
            // first row data
        let firstData = setOfQuestions[questionCount]
            
            // questions
        let firstQuestion = firstData["question"] as? String
            textView.text = firstQuestion
            
                // options
        let optionOfFirstQuestion = firstData["option"] as? Array<Any>
            option1.setTitle(optionOfFirstQuestion?[0] as? String, for: .normal)
            option2.setTitle(optionOfFirstQuestion?[1] as? String, for: .normal)
            option3.setTitle(optionOfFirstQuestion?[2] as? String, for: .normal)
            option4.setTitle(optionOfFirstQuestion?[3] as? String, for: .normal)
    
}

 //Checking
    @IBAction func checkAnswer(_ sender: UIButton) {
        let firstAnswer = setOfQuestions[questionCount]
        let correctAns = firstAnswer["answer"] as? String
        if let options = firstAnswer["option"] as? [String] {
            if correctAns == options[sender.tag]{
                scoreLabel.text = "Correct"
                score += 1
                
            } else if correctAns != options[sender.tag] {
                scoreLabel.text = "Wrong"
            
            }
        
 
// Next question button
//    @IBAction func nextQuestion(_ sender: Any) {
        questionCount += 1
        if questionCount < setOfQuestions.count{
           
            let firstData = setOfQuestions[questionCount]
                // questions
            
            let firstQuestion = firstData["question"] as? String
                textView.text = firstQuestion
                    // options
            let optionOfFirstQuestion = firstData["option"] as? Array<Any>
                option1.setTitle(optionOfFirstQuestion?[0] as? String, for: .normal)
                option2.setTitle(optionOfFirstQuestion?[1] as? String, for: .normal)
                option3.setTitle(optionOfFirstQuestion?[2] as? String, for: .normal)
                option4.setTitle(optionOfFirstQuestion?[3] as? String, for: .normal)
            score = score + 0
            
           }else if questionCount == setOfQuestions.count{
            if let thirdVC = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController {
                thirdVC.result = "Total Score: \n \(String(score)) out of \(String(setOfQuestions.count))"
            self.navigationController?.pushViewController(thirdVC, animated: true)
        }
        }
        
        }
}
    }
//}


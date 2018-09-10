//
//  AnswerViewController.swift
//  q-and-a
//
//  Created by Ilgar Ilyasov on 9/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var askerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answererNameTextField: UITextField!
    @IBOutlet weak var answerTextView: UITextView!
    var questionController: QuestionController?
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func submitAnswerBarButtonAction(_ sender: Any) {
        guard let answerer = answererNameTextField.text,
              let answer = answerTextView.text else { return }
        
        if answer == "" && answerer == "" {
            questionController?.updateQuestion(question: <#T##Question#>, answer: answer, answerer: answerer)
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    func updateViews() {
        guard let theQuestion = question?.question,
              let theAsker = question?.asker else { return }
        
        questionLabel.text = theQuestion
        askerLabel.text = theAsker
    }
}

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
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    @IBAction func submitAnswerBarButtonAction(_ sender: Any) {
        guard let theQuestion = self.question,
              let answerer = answererNameTextField.text,
              let answer = answerTextView.text else { return }
        
        if answer != "" && answerer != "" {
            questionController?.updateQuestion(question: theQuestion, answer: answer, answerer: answerer)
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    func updateViews() {
        guard let theQuestion = question?.question,
              let theAsker = question?.asker,
              let theAnswer = question?.answer,
              let theAnswerer = question?.answerer else { return }
        
        navigationItem.title = theQuestion
        questionLabel.text = theQuestion
        askerLabel.text = theAsker
        answererNameTextField.text = theAnswerer
        answerTextView.text = theAnswer
    }
}

//
//  AskQuestionViewController.swift
//  q-and-a
//
//  Created by Ilgar Ilyasov on 9/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class AskQuestionViewController: UIViewController {

    @IBOutlet weak var askerNameTextField: UITextField!
    @IBOutlet weak var questionTextView: UITextView!
    var questionController: QuestionController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitQuestionBarButtonAction(_ sender: Any) {
        guard let question = questionTextView.text,
              let asker = askerNameTextField.text else { return }
        
        if question == "" && asker == "" {
            questionController?.createQuestion(question: question, asker: asker)
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
}

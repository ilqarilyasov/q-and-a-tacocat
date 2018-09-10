//
//  QuestionsTableViewController.swift
//  q-and-a
//
//  Created by Ilgar Ilyasov on 9/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController {
    
    let questionController = QuestionController() // Create an instance to access the QuestionController

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionController.questions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionsTableViewCell", for: indexPath) as? QuestionsTableViewCell else { return UITableViewCell()}
        let question = questionController.questions[indexPath.row]
        
        cell.question = question

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            let question = questionController.questions[indexPath.row]
            questionController.deleteQuestion(question: question)
            tableView.deleteRows(at: [indexPath], with: .fade)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AskQuestionSegue" {
            guard let AskQuestionVC = segue.destination as? AskQuestionViewController else { return }
            AskQuestionVC.questionController = questionController
            
        } else if segue.identifier == "QuestionCellSegue" {
            guard let AnswerVC = segue.destination as? AnswerViewController else { return }
            AnswerVC.questionController = questionController
        }
    }
}

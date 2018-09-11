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
        if editingStyle == .delete {
            let question = questionController.questions[indexPath.row]
            questionController.deleteQuestion(question: question)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AskQuestionSegue" {
            guard let askQuestionVC = segue.destination as? AskQuestionViewController else { return }
            askQuestionVC.questionController = questionController
            
        } else if segue.identifier == "QuestionCellSegue" {
            guard let answerVC = segue.destination as? AnswerViewController else { return }
            answerVC.questionController = questionController
            
            // Get the index of tapped cell and find the question on that cell by that index
            // And pass that question to the AnswerViewController
            guard let index = tableView.indexPathForSelectedRow else { return }
            let question = questionController.questions[index.row]
            
            answerVC.question = question
        }
    }
}

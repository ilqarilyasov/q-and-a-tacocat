//
//  QuestionController.swift
//  q-and-a
//
//  Created by Ilgar Ilyasov on 9/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class QuestionController {
    private(set) var questions: [Question] = []
    
    // MARK: - CRUD
    func createQuestion(question: String, asker: String) {
        let newQuestion = Question(question: question, asker: asker)
        questions.append(newQuestion)
    }
    
    // Find the question and update it asnwer, answerer property values
    func updateQuestion(question: Question, answer: String, answerer: String) {
        guard let index = questions.index(of: question) else { return }
        questions[index].answer = answer
        questions[index].answerer = answerer
    }
    
    // Find the question and remove it from the array
    func deleteQuestion(question: Question) {
        guard let index = questions.index(of: question) else { return }
        questions.remove(at: index)
    }
    
}

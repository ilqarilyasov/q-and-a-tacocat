//
//  Question.swift
//  q-and-a
//
//  Created by Ilgar Ilyasov on 9/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let asker: String
    let answer: String?
    let answerer: String?
    
    init(question: String, asker: String, answer: String? = nil, answerer: String? = nil){
        self.question = question
        self.asker = asker
        self.answer = answer
        self.answerer = answerer
    }
}

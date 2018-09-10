//
//  QuestionsTableViewCell.swift
//  q-and-a
//
//  Created by Ilgar Ilyasov on 9/10/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class QuestionsTableViewCell: UITableViewCell {
    
    // Create an instance of the model
    var question: Question? {
        didSet { updateViews() }
    }

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var askedByLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    private func updateViews() {
        guard let theQuestion = question?.question,
              let asker = question?.asker else { return }
        
        questionLabel.text = theQuestion
        askedByLabel.text = asker
        
    }

}

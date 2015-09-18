//
//  SubjectCell.swift
//  Gojimo
//
//  Created by Roger TAN on 17/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import UIKit

class SubjectCell: UITableViewCell {
    
    func configureCell(subject : Subject) {
        self.textLabel?.text = subject.title
        if subject.colour != nil && subject.colour != "" {
            self.backgroundColor = UIColor(rgba: subject.colour)
        }
    }
    
}

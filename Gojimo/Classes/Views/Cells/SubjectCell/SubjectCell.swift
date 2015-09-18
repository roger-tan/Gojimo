//
//  SubjectCell.swift
//  Gojimo
//
//  Created by Roger TAN on 17/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import UIKit

class SubjectCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class internal func nib() -> UINib {
        return UINib(nibName: "SubjectCell", bundle: nil)
    }
    
    func configureCell(subject : Subject) {
        self.textLabel?.text = subject.title
        if subject.colour != nil && subject.colour != "" {
            self.backgroundColor = UIColor(rgba: subject.colour)
        }
    }
    
}

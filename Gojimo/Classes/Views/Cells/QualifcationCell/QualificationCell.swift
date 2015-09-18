//
//  QualificationCell.swift
//  Gojimo
//
//  Created by Roger TAN on 16/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import UIKit

class QualificationCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureCell(qualification : Qualification) {
        self.nameLabel?.text = qualification.name
        self.imageView?.image = (qualification.country.code != nil) ? UIImage(named: qualification.country.code) : nil
    }
}

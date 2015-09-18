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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class internal func nib() -> UINib {
        return UINib(nibName: "QualificationCell", bundle: nil)
    }
    
    func configureCell(qualification : Qualification) {
        self.nameLabel?.text = qualification.name
        if qualification.country.code != nil {
            self.imageView?.image = UIImage(named: "\(qualification.country.code).png")
        }
    }
}

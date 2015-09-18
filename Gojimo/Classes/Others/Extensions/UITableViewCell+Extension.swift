//
//  UITableViewCell+Extension.swift
//  Gojimo
//
//  Created by Roger TAN on 18/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import UIKit

extension UITableViewCell {

    /**
    Get the nib view
    */

    class internal func nib() -> UINib {
        let nameSpaceClassName = NSStringFromClass(self)
        let className = nameSpaceClassName.componentsSeparatedByString(".").last! as String
        return UINib(nibName: className, bundle: nil)
    }
}

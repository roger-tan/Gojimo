//
//  SubjectsViewController.swift
//  Gojimo
//
//  Created by Roger TAN on 17/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController, UITableViewDelegate {
    // Constants
    let kSubjectCellIdentifier = "SubjectCell"
    // Variables
    @IBOutlet weak var tableView: UITableView!
    var subjectsArrayDataSource: ArrayDataSource!
    var qualification:Qualification! {
        didSet {
            self.title = qualification.name
        }
    }

    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }
    
    // MARK: - Private
    
    func setUp() {
        self.tableView.delegate = self;
        let configureCell: CellConfigureBlock = { (cell, subject) -> () in
            let innerCell = cell as? SubjectCell
            innerCell!.configureCell(subject as! Subject)
        }
        
        self.subjectsArrayDataSource = ArrayDataSource(items: qualification.subjects, cellIdentifier: kSubjectCellIdentifier, configureCellBlock: configureCell)
        self.tableView.dataSource = self.subjectsArrayDataSource
        self.tableView.registerNib(SubjectCell.nib(), forCellReuseIdentifier: kSubjectCellIdentifier)
    }

}

//
//  SubjectsViewController.swift
//  Gojimo
//
//  Created by Roger TAN on 17/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController, UITableViewDelegate {
    let kSubjectCellIdentifier = "SubjectCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var subjects: NSArray!
    
    var subjectsArrayDataSource: ArrayDataSource!
    
    var qualification:Qualification! {
        didSet {
            subjects = qualification.subjects
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self;
        let configureCell: CellConfigureBlock = { (cell, subject) -> () in
            let innerCell = cell as? SubjectCell
            innerCell!.configureCell(subject as! Subject)
        }

    
        self.subjectsArrayDataSource = ArrayDataSource(items: subjects, cellIdentifier: kSubjectCellIdentifier, configureCellBlock: configureCell)
        self.tableView.dataSource = self.subjectsArrayDataSource
        self.tableView.registerNib(SubjectCell.nib(), forCellReuseIdentifier: kSubjectCellIdentifier)

//        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

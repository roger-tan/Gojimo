//
//  QualificationsViewController.swift
//  Gojimo
//
//  Created by Roger TAN on 16/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import UIKit
import SVProgressHUD

class QualificationsViewController: UIViewController, UITableViewDelegate {
    let kQualificationCellIdentifier = "NewsCell"

    @IBOutlet weak var tableView: UITableView!
    
    var qualificationsArrayDataSource: ArrayDataSource!
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       setUp()
    }
    
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let qualification: Qualification = self.qualificationsArrayDataSource.itemAtIndexPath(indexPath) as! Qualification
        
        guard let subject = qualification.subjects
            where subject.count > 0 else {
                SVProgressHUD.showErrorWithStatus("No subjects available")
                return;
        }
        
        let subjectsViewController = SubjectsViewController()
        subjectsViewController.qualification = qualification
        self.navigationController?.pushViewController(subjectsViewController, animated: true)
    }
    
    // MARK: - Private
    
    func setUp() {
        self.tableView.delegate = self;
        let configureCell: CellConfigureBlock = { (cell, qualification) -> () in
            let innerCell = cell as? QualificationCell;
            let innerQualifcation = qualification as? Qualification;
            innerCell?.configureCell(innerQualifcation!)
        }
        
        SVProgressHUD.showWithStatus("Loading...")
        Qualification.fetchAll({(qualifications, error) -> Void in
            self.qualificationsArrayDataSource = ArrayDataSource(items: qualifications!, cellIdentifier: self.kQualificationCellIdentifier, configureCellBlock: configureCell)
            self.tableView.dataSource = self.qualificationsArrayDataSource
            self.tableView.registerNib(QualificationCell.nib(), forCellReuseIdentifier: self.kQualificationCellIdentifier)
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        })
    }

}

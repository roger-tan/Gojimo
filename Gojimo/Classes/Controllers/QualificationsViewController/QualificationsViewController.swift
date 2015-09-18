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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupCollectionView() {
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
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let subjectsViewController = SubjectsViewController()
        let qualification: Qualification = self.qualificationsArrayDataSource.itemAtIndexPath(indexPath) as! Qualification
        subjectsViewController.qualification = qualification
        
        guard let subject = qualification.subjects
            where subject.count > 0 else {
                SVProgressHUD.showErrorWithStatus("No subjects available")
                return;
        }
        
        self.navigationController?.pushViewController(subjectsViewController, animated: true)
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

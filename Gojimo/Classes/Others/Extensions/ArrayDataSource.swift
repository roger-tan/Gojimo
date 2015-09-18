//
//  ArrayDataSource.swift
//  Gojimo
//
//  Created by Roger TAN on 16/09/15.
//  Copyright © 2015 Roger TAN. All rights reserved.
//

import UIKit

typealias CellConfigureBlock = (cell : AnyObject?, item: AnyObject?) -> Void;

class ArrayDataSource : NSObject, UITableViewDataSource {
    
    var items: NSArray!;
    var cellIdentifier: String!;
    var configureCellBlock: CellConfigureBlock!;
    
    
    init(items: NSArray, cellIdentifier: String, configureCellBlock: CellConfigureBlock) {
        self.items = items;
        self.cellIdentifier = cellIdentifier;
        self.configureCellBlock = configureCellBlock;
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject? {
        return self.items[indexPath.row];
    }
    
    // MARK : UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath)
        
        let item: AnyObject? = self.itemAtIndexPath(indexPath);
        self.configureCellBlock(cell: cell, item: item);
        
        return cell;
    }
}
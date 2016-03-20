//
//  CreatePostViewController.swift
//  PS
//
//  Created by Andrew Rudsky on 3/20/16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class CreatePostViewController : UITableViewController {
    
    var extendedSectionCell : Int = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let backgroundView = UIView(frame: view.bounds);
        backgroundView.backgroundColor = UIColor.yellowColor()
        view.insertSubview(backgroundView, atIndex: 0)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
//    func didChooseOptionInCell(tableCell: UITableViewCell) {
//        
//    }
    
//MARK: TableView
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false);
        
        if(extendedSectionCell == indexPath.section) {
            extendedSectionCell = -1
        }
        else {
            extendedSectionCell = indexPath.section
        }
        
        tableView.reloadData()
    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3;
//    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var result : CGFloat = 100;
        
        if indexPath.section == extendedSectionCell {
            switch indexPath.row {
            case 0:
                break;
            case 1:
                result = 120.0;
                break;
            case 2:
                result = 50.0;
                break;
            default:
                break;
            }
        }
        else {
            switch indexPath.row {
            case 0:
                break;
            case 1:
                result = 0.0;
                break;
            case 2:
                result = 0.0;
                break;
            default:
                break;
            }
        }
        
        return result;
    }
}
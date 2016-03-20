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
        
        let backgroundView = UIImageView(frame: view.bounds)
        backgroundView.image = UIImage(named: "background")
        tableView.backgroundView = backgroundView
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        toggleDone()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    func doneActivated() {
        
    }
    
    func toggleDone() {
        
        if extendedSectionCell == -1 {
            navigationItem.rightBarButtonItem = nil;
        }
        else {
            navigationController?.navigationBarHidden = false
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: UIBarButtonItemStyle.Done, target: self, action: Selector(self.doneActivated()))
        }
    }
    
    
//MARK: TableView
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false);
        
        if(extendedSectionCell == indexPath.section) {

        }
        else {
            extendedSectionCell = indexPath.section
        }
        
        toggleDone()
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var result : CGFloat = 120;
        
        if indexPath.section == extendedSectionCell {
            switch indexPath.row {
            case 0:
                break;
            case 1:
                result = 140.0;
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
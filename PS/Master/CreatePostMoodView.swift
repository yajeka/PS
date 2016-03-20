//
//  CreatePostMoodView.swift
//  PS
//
//  Created by Andrew Rudsky on 3/20/16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class CreatePostMoodView : UITableViewCell {

    @IBOutlet
    var outletsList : [UIImageView]!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction
    func didSelectImageView(sender: UIGestureRecognizer?) {
        
        for view in outletsList {
//            if view == sender?.view {
//                view.superview?.contentScaleFactor = 1.2;
//            }
//            else {
//                view.superview?.contentScaleFactor = 1.0;
//            }
        }
    }
}

//
//  CreatePostMoodView.swift
//  PS
//
//  Created by Andrew Rudsky on 3/20/16.
//  Copyright © 2016 hackathon. All rights reserved.
//

import UIKit

class CreatePostMoodView : UITableViewCell {
    
    var lastSelected : Int = -1;
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction
    func didSelectImageView(sender: UIGestureRecognizer?) {
        
        if let sourceTag = sender?.view?.tag {
            
        }
    }
}

//
//  ReviewCell.swift
//  customCellDemo
//
//  Created by J on 7/11/2018.
//  Copyright © 2018 Jman. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TableViewCell.swift
//  Gemini
//
//  Created by Paolo Giambi on 17/10/2018.
//  Copyright © 2018 Paolo Giambi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var gemName: UILabel!
    @IBOutlet weak var gemImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gemImage.layer.cornerRadius = 10
        self.gemImage.layer.masksToBounds = true
    }
}

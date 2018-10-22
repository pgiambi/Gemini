//
//  GemViewController.swift
//  Gemini
//
//  Created by Paolo Giambi on 15/10/2018.
//  Copyright © 2018 Paolo Giambi. All rights reserved.
//

import UIKit

class gemViewController: UIViewController {

    var gem: Gem?

    @IBOutlet weak var gemImage: UIImageView!
    
    @IBOutlet weak var gemName: UILabel!
    
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gemImage.image = gem?.image ?? nil
        gemImage.layer.cornerRadius = 10
        gemImage.layer.masksToBounds = true
        gemName.text = gem?.name ?? "not found"
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1700)
    }
}

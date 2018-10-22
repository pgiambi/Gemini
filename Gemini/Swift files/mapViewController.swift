//
//  mapViewController.swift
//  Gemini
//
//  Created by Paolo Giambi on 15/10/2018.
//  Copyright © 2018 Paolo Giambi. All rights reserved.
//

import UIKit

class mapViewController: UIViewController, UIGestureRecognizerDelegate {

    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    var trayOriginalCenter: CGPoint!

    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            trayOriginalCenter = trayView.center
        } else if sender.state == .changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
        } else if sender.state == .ended {
            if velocity.y > 0 {
                UIView.animate(withDuration: 0.3) {
                    self.trayView.center = self.trayDown
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.trayView.center = self.trayUp
                }
            }
        }
    }

    @IBOutlet weak var trayView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayDownOffset = trayView.frame.size.height - 58
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)
        trayView.center = CGPoint(x: trayView.center.x, y: trayView.center.y + trayDownOffset)
       
        
        
    }


}

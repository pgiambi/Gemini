//
//  gemsTableViewController.swift
//  Gemini
//
//  Created by Paolo Giambi on 15/10/2018.
//  Copyright © 2018 Paolo Giambi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "tabCell"

class gemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var gems: [Gem] = [Gem.init(name: "Positano", info: "beautiful", image: UIImage(named: "positano")!),Gem.init(name: "Sorrento", info: "", image: UIImage(named: "sorrento")!),Gem.init(name: "Baia Trentaremi", info: "", image: UIImage(named: "baia trentaremi")!)]
    
    @IBOutlet weak var gemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gemTableView.delegate = self
        self.gemTableView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        
        cell.gemImage.image = gems[indexPath.item].image
        cell.gemName.text = gems[indexPath.item].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGemSegue" {
            if let destinationVC = segue.destination as? gemViewController {
                if let indexPath = self.gemTableView.indexPathForSelectedRow {
                    destinationVC.gem = gems[indexPath.row]
                }
            }
        }
    }
}

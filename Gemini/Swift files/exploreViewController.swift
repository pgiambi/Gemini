//
//  ExploreCollectionViewController.swift
//  Gemini
//
//  Created by Paolo Giambi on 15/10/2018.
//  Copyright © 2018 Paolo Giambi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class exploreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var gems: [Gem] = [Gem.init(name: "Positano", info: "beautiful", image: UIImage(named: "positano")!),Gem.init(name: "Sorrento", info: "", image: UIImage(named: "sorrento")!),Gem.init(name: "Baia trentaremi", info: "", image: UIImage(named: "baia trentaremi")!)]

    @IBOutlet weak var gemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gemCollectionView.delegate = self
        self.gemCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell

        cell.gemImage.image = gems[indexPath.item].image
        cell.gemName.text = gems[indexPath.item].name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExpSegue" {
            if let destinationVC = segue.destination as? gemViewController {
                let cell = sender as? CollectionViewCell
                if let indexPath = self.gemCollectionView.indexPath(for: cell!) {
                    destinationVC.gem = gems[indexPath.item]
                }
            }
        }
    }
}

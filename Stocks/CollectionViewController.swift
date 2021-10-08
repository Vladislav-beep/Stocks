//
//  CollectionViewController.swift
//  Stocks
//
//  Created by Владислав Сизонов on 08.10.2021.
//

import UIKit


class CollectionViewController: ViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
   // let itemsPerRow = CGFloat(itemsPerRowStepper.value)
    let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    let stocks = ["1", "2", "3"]
    var itemsPerRow: CGFloat = 5

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var itemsPerRowStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsPerRowStepper.maximumValue = 4
        itemsPerRowStepper.minimumValue = 2
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        itemsPerRow = CGFloat(sender.value)
        self.collectionView.reloadData()
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    
    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stockCell", for: indexPath)
    
        cell.backgroundColor = .blue
    
        return cell
    }
}
    
    extension CollectionViewController: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            
            let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
            let availableWidth = collectionView.frame.width - paddingWidth
            let widthPerItem = availableWidth / itemsPerRow
            
            
            return CGSize(width: widthPerItem, height: widthPerItem)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            sectionInserts
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInserts.left
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInserts.left
        }
    }
    

    // MARK: UICollectionViewDelegate

    
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */



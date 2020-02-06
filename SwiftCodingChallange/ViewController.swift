//
//  ViewController.swift
//  SwiftCodingChallange
//
//  Created by Abhishek on 06/02/20.
//  Copyright © 2020 Ab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView : UICollectionView!

    var data : [User] = []
    lazy var isiPad = UIDevice.current.model.hasPrefix("iPad")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupCollectionViewLayout()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UserCollectionViewCell.NibObject(), forCellWithReuseIdentifier: UserCollectionViewCell.nameOfClass)
        
        data = DataManager.getData()
        collectionView.reloadData()
    }
    
    func setupCollectionViewLayout() {
        let numberOfRows = isiPad ? 3 : 1
        let flowLayout = ColumnFlowLayout(cellsPerRow: numberOfRows)
        collectionView.collectionViewLayout = flowLayout
    }
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.nameOfClass, for: indexPath) as? UserCollectionViewCell {
            
            let file = data[indexPath.item]
            cell.configure(with: file, isIpad: self.isiPad)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}


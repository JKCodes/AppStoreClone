//
//  FeaturedAppsController.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/18/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "categoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }
}


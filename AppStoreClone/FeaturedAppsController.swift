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
    private let largeCellId = "largeCell"
    private let headerId = "headerId"
    
    private let headerHeight: CGFloat = 120
    
    var featuredApps: FeaturedApps?
    var categories: [Category]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Featured"
        
        Category.fetchFeaturedApps { [weak self] (featuredApps) in
            guard let this = self else {
                return
            }
            
            this.featuredApps = featuredApps
            this.categories = featuredApps.categories
            this.collectionView?.reloadData()
        }
        
        
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        
        collectionView?.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    func showAppDetail(for app: App) {
        let layout = UICollectionViewFlowLayout()
        let appDetailController = AppDetailController(collectionViewLayout: layout)
        appDetailController.app = app
        
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCategoryCell
            cell.category = categories?[indexPath.item]
            cell.featuredAppsController = self
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
            cell.category = categories?[indexPath.item]
            cell.featuredAppsController = self
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = categories?.count {
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 160)
        } else {
            return CGSize(width: view.frame.width, height: 230)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: headerHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        
        header.category = featuredApps?.bannerCategory
        return header
    }
}


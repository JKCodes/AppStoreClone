//
//  CategoryCell.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/18/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class CategoryCell: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    private let cellId = "appCell"
    private let contentOffset: CGFloat = 14.0
    private let dividerHeight: CGFloat = 0.5
    private let nameLabelHeight: CGFloat = 30.0
    private let cellWidth: CGFloat = 100.0
    private var cellHeight: CGFloat = 0.0
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Best New Apps"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        backgroundColor = .clear
    
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
    
        addAllSubviews()
        
        setupNameLabel()
        setupCollectionView()
        setupDividerView()
    }
    
    func addAllSubviews() {
        addSubview(nameLabel)
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
    }
    
    func setupNameLabel() {
        nameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: contentOffset, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: nameLabelHeight)
    }
    
    func setupCollectionView() {
        appsCollectionView.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, bottom: dividerLineView.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func setupDividerView() {
        dividerLineView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: contentOffset, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: dividerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellHeight = frame.height - nameLabelHeight - dividerHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, contentOffset, 0, contentOffset)
    }
}

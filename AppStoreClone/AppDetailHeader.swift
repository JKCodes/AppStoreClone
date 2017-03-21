//
//  AppDetailHeader.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/21/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class AppDetailHeader: BaseCell {
    
    private let standardOffset: CGFloat = 14
    private let imageWidth: CGFloat = 100
    private let imageHeight: CGFloat = 100
    private let segmentControlXOffset: CGFloat = 40
    private let segmentControlHeight: CGFloat = 34
    
    var app: App? {
        didSet {
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            
            nameLabel.text = app?.name
            
            if let price = app?.price?.stringValue {
                buyButton.setTitle("$\(price)", for: .normal)
            }
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Details", "Reviews", "Related"])
        sc.tintColor = .darkGray
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Example"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.layer.borderColor = UIColor(red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        addSubview(buyButton)
        addSubview(dividerLineView)
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: standardOffset, leftConstant: standardOffset, bottomConstant: 0, rightConstant: 0, widthConstant: imageWidth, heightConstant: imageHeight)
        segmentedControl.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: standardOffset, leftConstant: segmentControlXOffset, bottomConstant: 0, rightConstant: segmentControlXOffset, widthConstant: 0, heightConstant: segmentControlHeight)
        nameLabel.anchor(top: imageView.topAnchor, left: imageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: standardOffset, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        buyButton.anchor(top: nil, left: nil, bottom: segmentedControl.topAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: standardOffset, rightConstant: standardOffset, widthConstant: 60, heightConstant: 34)
        dividerLineView.anchor(top: segmentedControl.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: standardOffset, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}

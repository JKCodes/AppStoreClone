//
//  AppCell.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/18/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class AppCell: BaseCell {
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "frozen")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Temporary text for the app"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Entertainment"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$9.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()
    
    override func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
        addSubview(priceLabel)
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: frame.width)
        nameLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 40)
        categoryLabel.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: -2, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 20)
        priceLabel.anchor(top: categoryLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: -2, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 20)
    }
}

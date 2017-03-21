//
//  LargeAppCell.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/21/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class LargeAppCell: AppCell {
    
    private let topOffset: CGFloat = 4
    private let bottomOffset: CGFloat = 14
    
    override func setupViews() {
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: topOffset, leftConstant: 0, bottomConstant: bottomOffset, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}


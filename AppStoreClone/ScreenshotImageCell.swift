//
//  ScreenshotImageCell.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/21/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class ScreenshotImageCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layer.masksToBounds = true
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
}

//
//  AppDetailDescriptionCell.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/21/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class AppDetailDescriptionCell: BaseCell {
    
    private let leftOffset: CGFloat = 14
    private let rightOffset: CGFloat = 14

    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "Example"
        return tv
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
    
        addSubview(textView)
        addSubview(dividerLineView)
        
        textView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: leftOffset, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        dividerLineView.anchor(top: textView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: leftOffset, bottomConstant: 0, rightConstant: rightOffset, widthConstant: 0, heightConstant: 0.5)
    }
}

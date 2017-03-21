//
//  FeaturedApps.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/21/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class FeaturedApps: NSObject {
    var bannerCategory: Category?
    var categories: [Category]?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "categories" {
            categories = [Category]()
            
            for dict in value as! [[String: AnyObject]] {
                let category = Category()
                category.setValuesForKeys(dict)
                categories?.append(category)
            }
        } else if key == "bannerCategory" {
            bannerCategory = Category()
            bannerCategory?.setValuesForKeys(value as! [String: AnyObject])
        } else {
            super.setValue(value, forKey: key)
        }
    }
}

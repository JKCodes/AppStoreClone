//
//  Category.swift
//  AppStoreClone
//
//  Created by Joseph Kim on 3/18/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class Category: NSObject {
    var name: String?
    var apps: [App]?
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            
            apps = [App]()
            for dict in value as! [[String: AnyObject]] {
                let app = App()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
            
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func fetchFeaturedApps(completionHandler: @escaping ([Category]) -> ()) {
        let urlString = "http://www.statsallday.com/appstore/featured"
        guard let url = URL(string: urlString) else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: AnyObject]
                    
                    var categories = [Category]()
                    
                    for dict in json["categories"] as! [[String: AnyObject]] {
                        let category = Category()
                        category.setValuesForKeys(dict)
                        categories.append(category)
                    }
                    
                    DispatchQueue.main.async {
                        completionHandler(categories)
                    }
                }
            } catch let err {
                print("\(err)")
            }
            
        }.resume()
    }
}

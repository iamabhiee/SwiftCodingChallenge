//
//  DataManager.swift
//  SwiftCodingChallange
//
//  Created by Abhishek on 06/02/20.
//  Copyright © 2020 Ab. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    class func getData() -> [User] {
        var users : [User] = []
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                let jsonSentence = try jsonDecoder.decode([User].self, from: data)
                users.append(contentsOf: jsonSentence)
            } catch {
                // handle error
            }
        }
        
        return users
    }
}

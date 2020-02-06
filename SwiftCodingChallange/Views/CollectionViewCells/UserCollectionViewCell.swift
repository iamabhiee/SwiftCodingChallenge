//
//  UserCollectionViewCell.swift
//  SwiftCodingChallange
//
//  Created by Abhishek on 06/02/20.
//  Copyright © 2020 Ab. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblUserName : UILabel!
    @IBOutlet weak var imgUserAvatar : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with user : User) {
        lblUserName.text = user.name
        imgUserAvatar.load(urlStr: user.avatar)
    }
}

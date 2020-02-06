//
//  ViewController.swift
//  SwiftCodingChallange
//
//  Created by Abhishek on 06/02/20.
//  Copyright © 2020 Ab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data : [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        data = DataManager.getData()
    }
}


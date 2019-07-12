//
//  STNavigationViewController.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/11.
//  Copyright © 2019 shuixin. All rights reserved.
//

import UIKit

class STNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navbar = UINavigationBar.appearance()
        navbar.backIndicatorImage = R.image.nav_back()
        navbar.backIndicatorTransitionMaskImage = R.image.nav_back()
    }
}

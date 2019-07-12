//
//  AppDelegate.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/4.
//  Copyright © 2019 shuixin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarVC = STTabBarController()
        STMainTabManager.shared.loadWithCache { (tabInfos) -> Void? in
            tabBarVC.configTabInfos(tabInfos!)
        }
        window?.rootViewController = tabBarVC
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        return true
    }

}


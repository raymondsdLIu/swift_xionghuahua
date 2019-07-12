//
//  STTabBarController.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/4.
//  Copyright © 2019 shuixin. All rights reserved.
//

import UIKit
import Kingfisher

class STTabBarController: UITabBarController {

    lazy var badgeCache : [String : UIImageView] = {
        
        var cache = [String : UIImageView]()
        
        return cache
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tabBar.isTranslucent = false
    }
    
    func getTabViewController(tabTag: Int) -> UIViewController? {
        guard let vcs = viewControllers else {
            return nil
        }
        for vc in vcs {
            if (vc.tabBarItem.tag == tabTag) {
                return vc
            }
        }
        return nil
    }

    func configTabInfos(_ tabInfos: [STTabsInfo]?) {
        guard let tabInfos = tabInfos else {
            return
        }
        
        var vcs = [STNavigationController]()
        for tabInfo in tabInfos {
            
            let vc = createVCWithTabInfo(tabInfo)
            
            vcs.append(vc)
        }
        
        self.viewControllers = vcs
    }
    
    private func createVCWithTabInfo(_ tabInfo: STTabsInfo) -> STNavigationController {
        
        let nav = STNavigationController()
        nav.tabBarItem.title = tabInfo.title
        let size = CGSize(width: 24, height: 24)
        
        if let imgUrl = URL(string: tabInfo.imgurl ?? "") {
            
            ImageDownloader.default.downloadImage(with: imgUrl, retrieveImageTask: nil, options: nil, progressBlock: nil) { (image, error, url, data) in
                if let image = image {
                    let scaleImg = image.scaled2FillSize(size).withRenderingMode(.alwaysOriginal)
                    nav.tabBarItem.image = scaleImg
                }
            }
        }
        
        if let selImgUrl = URL(string: tabInfo.selImgUrl ?? "") {
            
            ImageDownloader.default.downloadImage(with: selImgUrl, retrieveImageTask: nil, options: nil, progressBlock: nil) { (image, error, url, data) in
                if let image = image {
                    let scaleImg = image.scaled2FillSize(size).withRenderingMode(.alwaysOriginal)
                    nav.tabBarItem.image = scaleImg
                }
            }
        }
        
        
        if let launchParams = tabInfo.action?.launchParams {
            switch launchParams.tab {
            case .web:
                let vc = ViewController()
                nav.viewControllers = [vc]
            case .error:
                let vc = ViewController()
                nav.viewControllers = [vc]
            case .fake:
                let vc = ViewController()
                nav.viewControllers = [vc]
            case .fake1:
                let vc = ViewController()
                nav.viewControllers = [vc]
            case .fake2:
                let vc = ViewController()
                nav.viewControllers = [vc]
            @unknown default:
                let vc = ViewController()
                nav.viewControllers = [vc]
            }
        }
        return nav
    }
}

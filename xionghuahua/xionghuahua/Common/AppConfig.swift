//
//  AppConfig.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/8.
//  Copyright © 2019 shuixin. All rights reserved.
//

import Foundation

class AppConfig {
    static let prdId = "16501"
    
    static let appId = Bundle.main.bundleIdentifier!
    
    static let appStoreId = "1469013761"
    
    static let groudId: String? = {
        let chars = AppConfig.appId.split(separator: ".")
        if let com = chars.first, let identifier = chars.last {
            return "group." + com + "." + identifier + ".appExtends"
        } else {
            return nil
        }
    }()
    
    static let umengKey = "5d08aad74ca357189c000fe2"
    
    static let baiduKey = "4W6rpVLuZ7aj2dvIUfikKDPV7lKFIrNc"
    
    static let gtAppId = "3nY69xIIOY5LaYCYKpSbU3"
    
    static let gtAppKey = "0j4Q6eqmbZ9EBafmBpPjX8"
    
    static let gtAppSecret = "Bjh8b3ooQk9cM5uNEcCuP4"
    
    static let protocolVersion = 30
    
    static let allChannel = 9999
    
    #if DEBUG
    static let channelId = 1099
    #else
    static let channelId = 100
    #endif
    
    static let encryptVersion = 1
    
    static let imageCacheSize = 1024*1024*100
}

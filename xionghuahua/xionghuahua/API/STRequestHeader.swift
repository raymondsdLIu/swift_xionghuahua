//
//  STRequestHeader.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/5.
//  Copyright © 2019 shuixin. All rights reserved.
//

import Foundation
import FCUUID
import CoreTelephony
import AdSupport  

class STRequestHeader {
    static let shared = STRequestHeader()
    
    private init() {}
    
    let uuid = FCUUID.uuidForDevice()
    
    let width: Int = Int(min(screenWidth, screenHeight))
    
    let height: Int = Int(max(screenWidth, screenHeight))
    
    var resolution: String {
        return String(width)+"*"+String(height)
    }
    
    let phoneMode = UIDevice.current.deviceName
    
    let model = UIDevice.current.model
    
    var deviceType: String {
        if model.contains("ipod") {
            return "ipod"
        } else if model.contains("ipad") {
            return "ipad"
        } else {
            return "iphone"
        }
    }
    
    var isJailbroken = MobClick.isJailbroken()
    
    
    lazy var imsi: String? = {
        #if targetEnvironment(simulator)
        return "ios_simulator"
        #else
        let netInfo = CTTelephonyNetworkInfo()
        guard let carrier = netInfo.subscriberCellularProvider else {
            return nil
        }
        return carrier.mobileCountryCode! + carrier.mobileCountryCode!
        #endif
    }()
    
    lazy var marketingInfo: [String: Any] = {
        var ret = [String: Any]()
        var idfa = ""
        let enableIdfatracking = ASIdentifierManager.shared().isAdvertisingTrackingEnabled
        if enableIdfatracking {
            idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
        ret["ifa"] = idfa
        ret["ifa_tracking"] = enableIdfatracking ? 1 : 0
        ret["jb"] = self.isJailbroken ? 1 : 0
        ret["dv"] = self.deviceType
        return ret
    }()
    
    let net = "unknown"
    
    func bulidRequest() -> [String: Any] {
        var ret = [String: Any]()
        ret["prdid"] = AppConfig.prdId
        ret["pversion"] = AppConfig.protocolVersion
        ret["phoneid"] = uuid
        ret["cversionname"] = appVersion
        ret["lang"] = language
        ret["imsi"] = imsi
        ret["dpi"] = resolution
        ret["sys"] = systemVersion
        ret["net"] = net
        ret["cversion"] = appBuild
        ret["mobnum"] = phoneMode
        ret["phone"] = phoneMode
        ret["platform"] = "ios"
        ret["marketing"] = self.marketingInfo
        
        return ret
    }
}

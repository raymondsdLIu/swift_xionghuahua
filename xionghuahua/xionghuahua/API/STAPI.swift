//
//  STAPI.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/5.
//  Copyright © 2019 shuixin. All rights reserved.
//

import Foundation
import Moya
import FCUUID


var userPath = "loan-user"
var statisticsPath = "loan-statistics"
var appPath = "loan-app"
var pushPath = "loan-push"
var vestPath = "loan-vest"

enum STAPI {
    case iconTab
    
}

extension STAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://test.shuixindk.cn")!
    }
    
    var path: String {
        switch self {
        case .iconTab:
            return appPath+"/icon/tabs"
        default:
            return vestPath
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .iconTab:
            return .post
        default:
            return .post
             
        }
    }
    
    var task: Task {
        var parmetersparmeters: [String : Any] = [:]
        parmetersparmeters["shandle"] = 0
        let phead = STRequestHeader.shared.bulidRequest()
        let pheadParam = ["phead" : phead]
        parmetersparmeters["data"] = pheadParam
        switch self {
        case .iconTab: break
        default:
            break
        }
        do {
            let data = try JSONSerialization.data(withJSONObject: parmetersparmeters, options: .prettyPrinted)
            let string = String(data: data, encoding: .utf8)
            print(string!)
        } catch  {
            
        }
        return .requestParameters(parameters: parmetersparmeters, encoding: JSONEncoding.default)
    }
    
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? {
        return ["Content-Type; charset=utf-8": "application/json"]
    }
}

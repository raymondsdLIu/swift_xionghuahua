//
//  STResult.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/9.
//  Copyright © 2019 shuixin. All rights reserved.
//

import Foundation
import HandyJSON

enum STResult {
    case failure(status: Int, msg: String?, errorcode: Int?)
    case success(status: Int)
}

struct STResponse: HandyJSON {
    var result: STResult?
    var dataJsonString: String?
}

extension STResponse {
    static func parserJson(_ json: [String: Any], field: String) -> STResponse? {
        var ret = STResponse.deserialize(from: json)
        if let jsonData = json[field] {
            if let data = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted) {
                let jsonString = String(data: data, encoding: .utf8)
                ret?.dataJsonString = jsonString
            }
        }
        
        return ret
    }
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper <<<
            self.result <-- TransformOf(fromJSON: { (result) -> STResult? in
                if let json = result {
                    let status = json["status"] as! Int
                    let msg = json["msg"] as? String
                    let errorcode = json["errorcode"] as? Int
                    
                    if status == 1 {
                        return .success(status: status)
                    } else {
                        return .failure(status: status, msg:msg, errorcode: errorcode)
                    }
                }
                return nil
            }, toJSON: { (result) -> [String: Any] in
                var ret = [String: Any]()
                if let data = result {
                    switch data {
                    case .success(let status):
                        ret["status"] = status
                    case .failure(let status, let msg, let errorcode):
                        ret["status"] = status
                        ret["msg"] = msg
                        ret["errorcdoe"] = errorcode
                    }
                }
                return ret
            })
    }
}

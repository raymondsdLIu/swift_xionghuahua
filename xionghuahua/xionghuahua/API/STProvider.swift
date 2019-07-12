//
//  STProvider.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/8.
//  Copyright © 2019 shuixin. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

class STProvider {
    
    static let shared = STProvider()
    
    private init() {}
    
    private let provider = MoyaProvider<STAPI>()
    
    
    func request(_ target: STAPI, key: String, completion: ((_ returnData: STResponse?) -> Void?)?) {
        provider.request(target) { (result) in
            guard let completion = completion else { return }
            guard let returnData = try? result.value?.mapModel(STResponse.self, field: key) else {
                completion(nil)
                return
            }
            completion(returnData)
        }
    }
    
   
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type, field: String) throws -> T? {
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
            guard let model = STResponse.parserJson(json, field: field) else {
                return nil
            }
            return model as? T
        }
        
        return nil
    }
}

extension Array: HandyJSON {
}

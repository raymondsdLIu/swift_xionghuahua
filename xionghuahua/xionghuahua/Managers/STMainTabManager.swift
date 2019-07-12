//
//  STMainTabManager.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/8.
//  Copyright © 2019 shuixin. All rights reserved.
//

import UIKit
import Moya

class STMainTabManager: STBaseManager {
    static let shared = STMainTabManager()
    
    private override init() {}
    
    
    func loadWithCache(_ completion: ((_ cache: [STTabsInfo]?) -> Void?)?) {
        STProvider.shared.request(STAPI.iconTab, key: "tabs") { (returnData) -> Void? in
            guard let completion = completion else {
                return nil
            }
            
            guard let result = returnData?.result else {
                completion(nil)
                return nil
            }
            
            switch result {
            case .failure( _, let msg, _):
                print(msg!)
                completion(nil)
            case .success( _):
                if let json = returnData?.dataJsonString {
                    print(json)
                    let tabs = [STTabsInfo].deserialize(from: json) as! [STTabsInfo]
                    completion(tabs)
                    return nil
                }
                return nil
            }
            return nil
        }
    }
}


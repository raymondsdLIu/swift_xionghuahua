//
//  STImageUtils.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/11.
//  Copyright © 2019 shuixin. All rights reserved.
//

import Foundation

extension UIImage {
    func scaled2FillSize(_ size: CGSize) -> UIImage {
        let scale = max(size.width/self.size.width, size.height/self.size.height)
        
        let width = self.size.width * scale
        let height = self.size.height * scale
        let rect = CGRect(x: (size.width-width)*0.5, y: (size.height-height)*0.5, width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.draw(in: rect)
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else { return self }
        UIGraphicsEndImageContext()
        return newImage
    }
}

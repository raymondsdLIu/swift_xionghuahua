//
//  STTabsInfo.swift
//  xionghuahua
//
//  Created by 刘佳 on 2019/7/9.
//  Copyright © 2019 shuixin. All rights reserved.
//

import Foundation
import HandyJSON

enum STOpenType: Int, HandyJSONEnum {
    case more = -1
    case native = 1
    case webview = 2
    case browser = 3
    case launch = 4
}

enum STLaunch: String, HandyJSONEnum {
    case mainTab = "launch_main_tab"
    case otherBrowser = "launch_other_browser"
    case vcWebView = "launch_vc_webView"
    case msgCenter = "launch_vc_message_center"
    case imagePageView = "launch_vc_image_pageview"
    case diaLogWebView = "launch_vc_dialog_webview"
}

struct STTabsInfo: HandyJSON {
    
    var title: String?
    
    var titleUrl: String?
    
    var name: String?
    
    var orderNum: Int = 0
    
    var openType: STOpenType = .launch
    
    var content: String?
    
    var extra: String?
    
    var action: STAction?
    
    var imgurl: String?
    
    var selImgUrl: String?
    
    var must_login: Bool = false
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper <<<
        self.selImgUrl <-- "after_click_img_url"
    }
    
}

struct STAction: HandyJSON {
    
    var launch: STLaunch = .mainTab
    
    var launchParams: STLaunchParams?
    
}

enum STTabType: String, HandyJSONEnum {
    case web = "web"
    case error = "error"
    case fake = "fake"
    case fake1 = "fake1"
    case fake2 = "fake2"
}

struct STLaunchParams: HandyJSON {
    
    var tab: STTabType = .web
    
    var title: String?
    
    var titleUrl: String?
    
    var htmlUrl: String?
    
    var withHead: Bool = true
    
    var showToolbar: Bool = true
    
    var clearTop: Bool = false
    
    var canBlockNetworkImg: Bool = true
    
    var reloadWhenLogin: Bool = true
    
    var takeOverBackPressed: Bool = false
    
    var callbackWhenResumeAndPause: Bool = false
    
    var isTitleBarImmerse: Bool = false
    
    var showTitle: Bool = true
    
    var injectCss: Bool = false
    
}

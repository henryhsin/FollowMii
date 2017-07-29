//
//  FunBanner.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/22.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
struct FunBanner: FunBannerProtocol {
    var title: String
    var subtitle: String
    var background: String
}

protocol FunBannerProtocol {
    var title: String {get set}
    var subtitle: String {get set}
    var background: String {get set}
}

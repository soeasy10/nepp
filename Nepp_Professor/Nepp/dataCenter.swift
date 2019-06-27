//
//  dataCenter.swift
//  Nepp
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 윤현담. All rights reserved.
//

import Foundation

let datacenter:DataCenter = DataCenter()

class DataCenter {
    var currentID:String // 현재 로그인한 아이디
    init() {
        currentID = ""
    }
}

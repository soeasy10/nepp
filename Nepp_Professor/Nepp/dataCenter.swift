//
//  dataCenter.swift
//  Nepp
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 윤현담. All rights reserved.
//

import Foundation

let dataCenter:DataCenter = DataCenter()

class DataCenter {
    var currentID:String // 현재 로그인한 아이디
    var classDic:[String:String]
    var week:Int
    init() {
        currentID = ""
        classDic = ["기초 C++ 프로그래밍":"00", "JAVA 프로그래밍":"11", "윈도우즈 프로그래밍":"22"]
        week = 1
    }
}

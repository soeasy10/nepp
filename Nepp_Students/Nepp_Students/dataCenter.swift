//
//  dataCenter.swift
//  Nepp_Students
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 sspog. All rights reserved.
//

import Foundation
import UIKit

var dataCenter:DataCenter = DataCenter()

class DataCenter {
    var currentID:String
    var classDic:[String:String]
    var major:String
    var name:String
    init() {
        currentID = ""
        classDic = ["기초 C++ 프로그래밍":"00", "JAVA 프로그래밍":"11", "윈도우즈 프로그래밍":"22"]
        major = ""
        name = ""
    }
    var id:String = ""
    var password:String = ""

    var imageData:[UIImage] = []
    var captureSessionState:Bool = true
}

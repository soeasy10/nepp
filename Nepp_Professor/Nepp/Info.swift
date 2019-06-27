//
//  Info.swift
//  Nepp
//
//  Created by 윤현담 on 27/06/2019.
//  Copyright © 2019 윤현담. All rights reserved.
//

import Foundation

struct ClassList: Codable {
    var classList:String
}

class ModelData: NSObject {
    static let shared: ModelData = ModelData()
    var id = ""
    var pw = ""
}

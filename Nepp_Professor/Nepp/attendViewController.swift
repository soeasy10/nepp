//
//  attendViewController.swift
//  Nepp
//
//  Created by 윤현담 on 27/06/2019.
//  Copyright © 2019 윤현담. All rights reserved.
//

import Foundation


import UIKit

class attendViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var statusList = ["출석", "결석", "조퇴"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return statusList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.statusList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 선택된 계정을 텍스트 필드에 입력
        let statusField = self.statusList[row]
        self.statusField.text = statusField
        
        
        self.view.endEditing(true)
    }
    
    
    @IBOutlet var statusField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}

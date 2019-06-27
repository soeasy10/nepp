//
//  loginViewController.swift
//  Nepp
//
//  Created by 윤현담 on 27/06/2019.
//  Copyright © 2019 윤현담. All rights reserved.
//

import Foundation
import UIKit

class loginViewController: UIViewController, UIPickerViewDelegate {

    
    
    @IBOutlet var idField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    var isAutoLogin: Bool = false
    
    @IBAction func autoLoginAction(_ sender: UIButton) {
        // auto login 선택 여부
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
            isAutoLogin = true
        }else{
            isAutoLogin = false
        }
    }

    //계속 호출되는 아이.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let isLoginned: Bool = false
        
        if isLoginned || UserDefaults.standard.bool(forKey: "auto")  {
            self.performSegue(withIdentifier: "showClassView", sender: self)
        }
        
        idField.leftViewMode = UITextField.ViewMode.always
        passwordField.leftViewMode = UITextField.ViewMode.always
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        ModelData.shared.id = self.idField.text!
        ModelData.shared.pw = self.passwordField.text!
        
        //자동 로그인 기능 구현 --> 자동 로그인 선택 시 자동으로 아이디랑 비밀번호 값을 입력
        if self.isAutoLogin{
            print("Auto Login")
            UserDefaults.standard.set(self.idField.text, forKey: "id")
            UserDefaults.standard.set(self.passwordField.text, forKey: "pw")
            UserDefaults.standard.set(true, forKey: "auto")
        }
        
        
        //segue의 목적지가 classViewController인지 확인
        guard let destination: classViewController = segue.destination as?
            classViewController else {
                print("목적지가 classViewController가 아님")
                return
        }
    
    
}
}

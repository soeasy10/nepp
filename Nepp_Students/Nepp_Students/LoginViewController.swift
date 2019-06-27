//
//  ViewController.swift
//  Nepp_Students
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 sspog. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // Firebase에서 ID와 비밀번호 가져오는 작업
    
    let dbId:String = "20181234"
    let dbPassword:String = "password"

    let loginAlert = UIAlertController(title:"웁스!", message:"로그인에 실패했습니다.\r\n아이디와 패스워드를 확인해주세요.", preferredStyle: .alert)
    let loginAlertAction = UIAlertAction(title:"확인", style: .default, handler: nil)

    @IBAction func loginAction(_ sender: Any) {
        
        if true {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let NavigationViewController = storyBoard.instantiateViewController(withIdentifier: "NVC") as! NavigationViewController
            self.present(NavigationViewController, animated:true, completion:nil)
        } else {
            present(loginAlert, animated: true, completion: nil)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // 홈버튼 누르고 다시 들어오면 로그인 오류 메시지 Alert 사라지도록
    @objc func dismissFunc(){
        self.loginAlert.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginAlert.addAction(loginAlertAction)

        // 키보드 숨기기
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")

        self.idField.delegate = self
        self.passwordField.delegate = self

        loginButton.setImage(UIImage(named: "buttonLogin"), for: .normal)
        loginButton.setImage(UIImage(named: "buttonLoginHover"), for: .highlighted)
        // Do any additional setup after loading the view.

        view.addGestureRecognizer(tap)
    }

    // 빈공간 탭해서 키보드 숨기기
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    // Done 버튼 눌러서 키보드 숨기기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


}


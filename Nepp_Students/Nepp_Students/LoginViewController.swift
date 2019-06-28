//
//  ViewController.swift
//  Nepp_Students
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 sspog. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // Firebase에서 ID와 비밀번호 가져오는 작업
    
    var id:String = ""
    var pw:String = ""

    let loginAlert = UIAlertController(title:"웁스!", message:"로그인에 실패했습니다.\r\n아이디와 패스워드를 확인해주세요.", preferredStyle: .alert)
    let loginAlertAction = UIAlertAction(title:"확인", style: .default, handler: nil)

    var ref: DatabaseReference!
    var databaseHandle:DatabaseHandle?

    @IBAction func loginAction(_ sender: Any) {
        if let idInput = idField.text {
            id = idInput
        }
        if let pwInput = passwordField.text {
            pw = pwInput
        }

        var dbPW:String = ""

        if id == "" || pw == "" {
            self.present(self.loginAlert, animated: true, completion: nil)
        } else {
            ref = Database.database().reference().child("students")

            databaseHandle = ref?.observe(.value) { (snapshot) in
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    switch snap.key {
                    case self.id:
                        dataCenter.id = self.id
                        break
                    default:
                        print("ERROR: noID")
                    }
                }
            }

            databaseHandle = ref?.child(id).observe(.value) { (snapshot) in
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    switch snap.key {
                    case "major":
                        dataCenter.major = snap.value as! String
                    case "name":
                        dataCenter.name = snap.value as! String
                    case "password":
                        dbPW = snap.value as! String
                        print(dbPW)
                    default:
                        print("ERROR: noPW")
                    }
                }
                if self.pw == dbPW { // 아이디와 패스워드가 모두 서버에 존재하며 일치
                    dataCenter.currentID = self.id
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let navigationViewController = storyBoard.instantiateViewController(withIdentifier: "NVC") as! navigationViewController
                    self.present(navigationViewController, animated:true, completion:nil)
                } else {
                    self.present(self.loginAlert, animated: true, completion: nil)
                }
            }
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


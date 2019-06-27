//
//  AttendanceViewController.swift
//  Nepp
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 윤현담. All rights reserved.
//

import UIKit
import Firebase

class AttendanceViewController: UIViewController {

    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var weekLabel: UILabel!

    var className: String?
    var now:Int = 0

    var start:Bool = false

    @IBAction func classAction(_ sender: Any) {
        if !start {
            startButton.setImage(UIImage(named: "buttonEndclass"), for: .normal)
            startButton.setImage(UIImage(named: "buttonEndclassHover"), for: .highlighted)
            start = true
        } else {
            // 버튼을 한 번 더 누르면 뒤로 가기
            // start가 true가 되면서
            _ = navigationController?.popViewController(animated: true)
                dataCenter.week += 1
        }
    }

    var ref: DatabaseReference!
    var databaseHandle:DatabaseHandle?
    var studentIDs:[String] = []
    var studentNames:[String] = []
    var attendances:[String] = []
    var classData:[String:[String]] = [:]
    var childVC: AttendanceTableViewController?

    override func viewWillAppear(_ animated: Bool) {
        if dataCenter.week <= 15 {
            weekLabel.text = String(dataCenter.week)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()

        classNameLabel.text = className!

        startButton.setImage(UIImage(named: "buttonStartclass"), for: .normal)
        startButton.setImage(UIImage(named: "buttonStartclassHover"), for: .highlighted)

        // Do any additional setup after loading the view.

        ref = Database.database().reference().child("professors")

        print(dataCenter.currentID)
        print(dataCenter.classDic[className!]!)

        databaseHandle = ref?.child(dataCenter.currentID).child(dataCenter.classDic[className!]!).observe(.value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                self.classData[snap.key] = snap.value as! [String]
            }

            for (key, value) in self.classData {
                self.studentIDs.append(key)
                var newVal:String = "미출결"
                switch value[0]{
                case "0":
                    newVal = "미출결"
                case "1":
                    newVal = "출석"
                case "2":
                    newVal = "결석"
                case "3":
                    newVal = "지각"
                case "4":
                    newVal = "조퇴"
                default:
                    newVal = "미출결"
                }
                self.attendances.append(newVal)
                self.studentNames.append(value[1])
            }

            self.childVC?.setData(studentIDArr: self.studentIDs, studentNameArr: self.studentNames, attendanceArr: self.attendances)
        }

        week = ++now;
    }

    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embedChildSegue" {
            if let childVC = segue.destination as? AttendanceTableViewController {
                self.childVC = childVC;
            }
        }
    }

}

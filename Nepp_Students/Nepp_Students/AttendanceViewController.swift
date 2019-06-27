//
//  AttendanceViewController.swift
//  Nepp_Students
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 sspog. All rights reserved.
//

import UIKit
import Firebase

class AttendanceViewController: UIViewController {

    @IBOutlet weak var classNameLabel: UILabel!

//    private var _className:String?
    var className:String?
//    var className:String? {
//        get {
//            return _className;
//        }
//        set(newClassame) {
//            _className = newClassame;
//            classNameLabel.text = newClassame
//
//            print(newClassame)
//
//            if newClassame != nil {
//                fetchDataFromFirebase();
//            }
//        }
//    }

    var ref: DatabaseReference!
    var databaseHandle:DatabaseHandle?
    var weeks:[String] = []
    // var dates:[String] = []
    var attendances:[String] = []
    var classData:[String:[String]] = [:] // 과목 : 주차별출결정보
    var childVC: AttendanceTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()

        classNameLabel.text = className

        print(className)

        if className != nil {
            dataCenter.currentID = "20141234"
            fetchDataFromFirebase();
        }
    }


    func fetchDataFromFirebase() {
        ref = Database.database().reference().child("students")
        print(dataCenter.classDic[className!]!)
        // child(dataCenter.classDic[className!]!)

        databaseHandle = ref?.child(dataCenter.currentID).observe(.value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                if snap.key == dataCenter.classDic[self.className!]! {
                    self.classData[snap.key] = snap.value as! [String]
                }
                if snap.key == "major" {
                    dataCenter.major = snap.value as! String
                }
                if snap.key == "name" {
                    dataCenter.name = snap.value as! String
                }
            }


            self.attendances = self.classData[dataCenter.classDic[self.className!]!]!
            self.weeks = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
            self.childVC?.setData(weeks: self.weeks, attendances: self.attendances)
        }
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

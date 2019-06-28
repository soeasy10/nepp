//
//  ClassInfoViewController.swift
//  Nepp_Students
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 sspog. All rights reserved.
//

import UIKit

class ClassInfoViewController: UIViewController {

    @IBOutlet weak var class1: UIButton!
    @IBOutlet weak var class2: UIButton!
    @IBOutlet weak var class3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()

        class1.setBackgroundImage(UIImage(named: "buttonEdge"), for: .normal)
        class1.setBackgroundImage(UIImage(named: "buttonFill"), for: .highlighted)
        class1.setTitleColor(UIColor(rgb: 0x4B589E), for: .normal)
        class1.setTitleColor(.white, for: .highlighted)

        class2.setBackgroundImage(UIImage(named: "buttonEdge"), for: .normal)
        class2.setBackgroundImage(UIImage(named: "buttonFill"), for: .highlighted)
        class2.setTitleColor(UIColor(rgb: 0x4B589E), for: .normal)
        class2.setTitleColor(.white, for: .highlighted)

        class3.setBackgroundImage(UIImage(named: "buttonEdge"), for: .normal)
        class3.setBackgroundImage(UIImage(named: "buttonFill"), for: .highlighted)
        class3.setTitleColor(UIColor(rgb: 0x4B589E), for: .normal)
        class3.setTitleColor(.white, for: .highlighted)


        // Do any additional setup after loading the view.
    }

    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        if segue.identifier == "class1segue" {
            let attendanceViewController = segue.destination as? AttendanceViewController
            if let avc = attendanceViewController {
                avc.className = class1.titleLabel!.text
            }
        }
        if segue.identifier == "class2segue" {
            let attendanceViewController = segue.destination as? AttendanceViewController
            if let avc = attendanceViewController {
                avc.className = class2.titleLabel!.text
            }
        }
        if segue.identifier == "class3segue" {
            let attendanceViewController = segue.destination as? AttendanceViewController
            if let avc = attendanceViewController {
                avc.className = class3.titleLabel!.text
            }
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

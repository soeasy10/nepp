//
//  AttendanceViewController.swift
//  Nepp
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 윤현담. All rights reserved.
//

import UIKit

class AttendanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()

        // Do any additional setup after loading the view.
    }

    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
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

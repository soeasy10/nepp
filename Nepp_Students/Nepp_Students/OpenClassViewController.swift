//
//  OpenClassViewController.swift
//  Nepp_Students
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 sspog. All rights reserved.
//

import UIKit

class OpenClassViewController: UIViewController {

    @IBOutlet weak var faceButton:UIButton!
    @IBOutlet weak var classButton:UIButton!

    //@IBOutlet weak var class2Button: UIButton!
    //@IBOutlet weak var class3Button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()

        classButton.setImage(UIImage(named: "buttonRegclass"), for: .normal)
        classButton.setImage(UIImage(named: "buttonRegclassHover"), for:.highlighted)

        faceButton.setImage(UIImage(named: "buttonFacerecog"), for: .normal)
        faceButton.setImage(UIImage(named: "buttonFacerecogHover"), for: .highlighted)





        // Do any additional setup after loading the view.
    }

    func setNavigationBar(){
        let bar:UINavigationBar! =  self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }

//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .default
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

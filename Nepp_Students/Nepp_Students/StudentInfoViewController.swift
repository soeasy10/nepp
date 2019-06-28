//
//  StudentInfoViewController.swift
//  Nepp_Students
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 sspog. All rights reserved.
//

import UIKit

class StudentInfoViewController: UIViewController {

    //@IBOutlet var btnCircle:UIButton!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        dataCenter.recogComplete = true

        profileImageView.contentMode = .scaleAspectFill
        profileImageView.image = dataCenter.imageData[1]
        majorLabel.text = dataCenter.major
        idLabel.text = dataCenter.id
        nameLabel.text = dataCenter.name
        
        // Do any additional setup after loading the view.
    }

    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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

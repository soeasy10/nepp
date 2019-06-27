//
//  AttendenceViewController.swift
//  Nepp_Students
//
//  Created by 윤현담 on 27/06/2019.
//  Copyright © 2019 sspog. All rights reserved.
//

import Foundation
import UIKit

class AttendenceViewController: UIViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination
        if let atTableViewController = destination as? AttendenceTableViewController {
           
        }
        
        
        
    }
    
    
}

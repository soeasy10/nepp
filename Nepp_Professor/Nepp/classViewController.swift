//
//  classViewController.swift
//  Nepp
//
//  Created by 윤현담 on 27/06/2019.
//  Copyright © 2019 윤현담. All rights reserved.
//

import Foundation
import UIKit
//import FMDB

class classViewController: UIViewController, UITableViewDataSource {
    
    //@IBOutlet var idLabel: UILabel!
    //@IBOutlet var passwordLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    //var assignment:String
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myClass.count
    }
    // indexPath에 해당하는 셀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ClassTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClassTableViewCell
        
        let myClass: ClassList = self.myClass[indexPath.row]
        
        cell.cLabel.text = myClass.classList
        
        
        //cell information 
        
        return cell
    }
    
    
    
    //id, pw --> class information from database
    override func viewWillAppear(_ animated: Bool) {
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
    }
    
    
    var myClass:[ClassList] = []
    
   
    
    // 웹에 JSON 데이터 요청
    
}

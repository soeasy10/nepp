//
//  AttendanceTableViewController.swift
//  Nepp_Students
//
//  Created by Tars on 6/27/19.
//  Copyright © 2019 sspog. All rights reserved.
//

import UIKit

class studentCell: UITableViewCell {

    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var bar1: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bar2: UILabel!
    @IBOutlet weak var attendanceLabel: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}


class AttendanceTableViewController: UITableViewController {

    var weekArr:[String] = []
    var datesArr:[String] = ["2019년 3월 4일", "2019년 3월 11일", "2019년 3월 18일", "2019년 3월 25일", "2019년 4월 1일", "2019년 4월 8일", "2019년 4월 15일", "2019년 4월 22일", "2019년 4월 29일", "2019년 5월 13일", "2019년 5월 20일", "2019년 5월 27일", "2019년 6월 3일", "2019년 6월 10일", "2019년 6월 17일"]
    var attendanceArr:[String] = []

    func setData(
        weeks:[String],
        attendances:[String]
    ) {
        self.weekArr = weeks
        // self.datesArr = dates
        self.attendanceArr = attendances

        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weekArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        guard let studentCell = cell as? studentCell else{
            return cell
        }
        studentCell.weekLabel.text = weekArr[indexPath.row]
        studentCell.bar1.text = "|"
        studentCell.dateLabel.text = datesArr[indexPath.row]
        studentCell.bar2.text = "|"

        var newAttendence:String = "미출결"
        switch attendanceArr[indexPath.row] {
        case "0":
            newAttendence = "미출결"
        case "1":
            newAttendence = "출석"
        case "2":
            newAttendence = "결석"
        case "3":
            newAttendence = "지각"
        case "4":
            newAttendence = "조퇴"
        default:
            print("ERROR")
        }
        studentCell.attendanceLabel.text = newAttendence

        return studentCell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

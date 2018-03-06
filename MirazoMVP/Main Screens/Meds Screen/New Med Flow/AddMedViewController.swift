//
//  AddMedViewController.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 3/5/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class AddMedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DoseAmountTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = medInfoTable.dequeueReusableCell(withIdentifier: "BasicNewMedCell", for: indexPath)
        switch indexPath.item {
            
        case 0:
            cell = medInfoTable.dequeueReusableCell(withIdentifier: "DoseCell", for: indexPath)
            if let doseCell = cell as? DoseAmountTableViewCell {
                doseCell.delegate = self
            }
        case 1:
            if let basicCell = cell as? BasicNewMedTableViewCell {
                basicCell.Icon.image = UIImage(named: "Clock")
                basicCell.label.text = "Dosage times"
            }
        case 2:
            if let basicCell = cell as? BasicNewMedTableViewCell {
                basicCell.Icon.image = UIImage(named: "Calendar")
                basicCell.label.text = "Dosage schedule"
            }
        case 3:
            if let basicCell = cell as? BasicNewMedTableViewCell {
                basicCell.Icon.image = UIImage(named: "Notification")
                basicCell.label.text = "Reminders"
            }
        default:
            print("Error")
        }
        return cell
    }

    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
    }
    
    @IBOutlet weak var medNameTF: UITextField! {
        didSet{
            medNameTF.attributedPlaceholder = NSAttributedString(string: "Enter name of medication", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Medium", size: 18.0)!])
            medNameTF.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            medNameTF.font = UIFont(name: "HelveticaNeue-Medium", size: 18.0)!
        }
    }
    
    var mgAmount: Int?
    func updatedAmount(to val: Int) {
        mgAmount = val
    }
    
    @IBOutlet weak var medInfoTable: UITableView! {
        didSet{
            medInfoTable.delegate = self
            medInfoTable.dataSource = self
        }
    }
}

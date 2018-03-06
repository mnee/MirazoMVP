//
//  DoseAmountTableViewCell.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 3/5/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class DoseAmountTableViewCell: UITableViewCell, UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let input = textField.text, let mg = Int(input){
            delegate?.updatedAmount(to: mg)
        }
    }
    
    weak var delegate: DoseAmountTableViewCellDelegate?
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var amountTF: UITextField! {
        didSet {
            amountTF.attributedPlaceholder = NSAttributedString(string: "0", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Medium", size: 18.0)!])
            amountTF.font = UIFont(name: "HelveticaNeue-Medium", size: 18.0)
            amountTF.delegate = self
        }
    }

}

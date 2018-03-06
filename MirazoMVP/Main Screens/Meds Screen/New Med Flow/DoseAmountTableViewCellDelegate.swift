//
//  DoseAmountTableViewCellDelegate.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 3/5/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import Foundation

protocol DoseAmountTableViewCellDelegate: class {
    
    func updatedAmount(to val: Int)
}

//
//  MedData.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 1/8/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import Foundation

struct MedData {
    var name: String
    var doses: [(Date, Bool, Int)]  // Tuple for dose time, wasTaken, and number of mg's
    var indexOfLastDose: Int
}

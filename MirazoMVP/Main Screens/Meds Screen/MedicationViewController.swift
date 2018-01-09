//
//  MedicationViewController.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 1/7/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class MedicationViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var height: CGFloat {
        get {
            // TODO: Calculate by number of meds for size
            return 700.0
        }
    }
    var margin: CGFloat {
        get {
            return height*0.03
        }
    }
    let cardHeight: CGFloat = 200.0
    var meds: [MedData] = [MedData(name: "Abilify", doses: [(Date(timeIntervalSinceNow: 3600), true, 15), (Date(timeIntervalSinceNow: 7200), false, 15)], indexOfLastDose: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navBar = self.navigationController?.navigationBar {
            navBar.barTintColor = #colorLiteral(red: 1, green: 0.862745098, blue: 0.007843137255, alpha: 1)
            // TODO: Set name from core data
            self.navigationItem.title = "Medications"
            // TODO: Make title bolder, left align?
            navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        
        let width = self.view.bounds.width
        scrollView.contentSize = CGSize(width: width, height: height)
        scrollView.backgroundColor = #colorLiteral(red: 0.9333306347, green: 0.9333306347, blue: 0.9333306347, alpha: 1)
        
        // TODO: Redo in tuple structure
        for index in meds.indices {
            let med = meds[index]
            // TODO: Write date properly, write tuple with alt names
            let medCard = MedCardView(med.name, med.doses[med.indexOfLastDose].0.description, med.doses[med.indexOfLastDose].1, med.doses[med.indexOfLastDose+1].0.description, CGRect(x: width*0.05, y: (margin+cardHeight)*CGFloat(index+1), width: width*0.9, height: cardHeight))
            scrollView.addSubview(medCard)
        }
    }

}

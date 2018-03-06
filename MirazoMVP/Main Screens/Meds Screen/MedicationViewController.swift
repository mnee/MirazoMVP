//
//  MedicationViewController.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 1/7/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class MedicationViewController: UIViewController {

    var meds: [MedData] = [MedData(name: "Abilify", doses: [(Date(timeIntervalSinceNow: 3600), true, 15), (Date(timeIntervalSinceNow: 7200), false, 15)], indexOfLastDose: 0), MedData(name: "Rexulti", doses: [(Date(timeIntervalSinceNow: 3600), true, 15), (Date(timeIntervalSinceNow: 7200), false, 15)], indexOfLastDose: 0), MedData(name: "Abilify", doses: [(Date(timeIntervalSinceNow: 3600), true, 15), (Date(timeIntervalSinceNow: 7200), false, 15)], indexOfLastDose: 0), MedData(name: "Abilify", doses: [(Date(timeIntervalSinceNow: 3600), true, 15), (Date(timeIntervalSinceNow: 7200), false, 15)], indexOfLastDose: 0), MedData(name: "Abilify", doses: [(Date(timeIntervalSinceNow: 3600), true, 15), (Date(timeIntervalSinceNow: 7200), false, 15)], indexOfLastDose: 0)]
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let plusWidth = UIScreen.main.bounds.width*0.1
    let cardHeight: CGFloat = 160.0
    
    // Currently restricts to no scroll at all if not needed to present full
    var height: CGFloat {
        get {
            return [scrollView.contentSize.height, plusWidth+margin*3+(cardHeight+margin)*CGFloat(meds.count)].max()!
        }
    }
    var margin: CGFloat { get { return cardHeight*0.1 } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = height
        
        if let navBar = self.navigationController?.navigationBar {
            navBar.removeBorder(with: #colorLiteral(red: 1, green: 0.862745098, blue: 0.007843137255, alpha: 1))
            self.navigationItem.title = "Medications"
            self.navigationItem.hidesBackButton = true
            // TODO: Left align?
            navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: 23.1)!]
        }
        
        let width = self.view.bounds.width
        scrollView.contentSize = CGSize(width: width, height: height)
        scrollView.backgroundColor = #colorLiteral(red: 0.9333306347, green: 0.9333306347, blue: 0.9333306347, alpha: 1)
        
        // TODO: Redo in tuple structure
        for index in meds.indices {
            let med = meds[index]
            // TODO: Write date properly, write tuple with alt names
            //       Fix date
            //       med.doses[med.indexOfLastDose].0.description -> to access date text
            let medCard = MedCardView(med.name, "15 mg, Mar. 5, 9 a.m.", med.doses[med.indexOfLastDose].1, "15 mg, Mar. 5, 6 p.m.", CGRect(x: width*0.05, y: margin+(margin+cardHeight)*CGFloat(index), width: width*0.9, height: cardHeight))
            scrollView.addSubview(medCard)
        }
    
        let imageView = UIImageView(frame: CGRect(x: scrollView.contentSize.width*0.45, y: (margin+cardHeight)*CGFloat(meds.count)+margin*2, width: plusWidth, height: plusWidth))
        imageView.image = UIImage(named: "Plus")
        let tapToAdd = UITapGestureRecognizer(target: self, action: #selector(addNewMed(_:)))
        imageView.addGestureRecognizer(tapToAdd)
        imageView.isUserInteractionEnabled = true
        scrollView.addSubview(imageView)
    }
    
    @objc func addNewMed(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "addNewMed", sender: nil)
    }

}

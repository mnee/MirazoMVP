//
//  MedCardView.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 1/7/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class MedCardView: UIView {

    var medicationName: String
    var nextDose: String
    var prevDose: String
    var prevTaken: Bool
    var sectionHeight: CGFloat {
        get {
            return (bounds.height - margin)/3
        }
    }
    
    init(_ medicationName: String, _ prevDose: String, _ prevTaken: Bool, _ nextDose: String, _ frame: CGRect) {
        self.medicationName = medicationName
        self.nextDose = nextDose
        self.prevDose = prevDose
        self.prevTaken = prevTaken
        
        super.init(frame: CGRect.zero)
        self.isOpaque = false
        self.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Base rounded card
        let roundedRect = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height), cornerRadius: cornerRadius)
        UIColor.white.setFill()
        roundedRect.fill()
        
        // Medicine title
        let medNameLabel = UILabel(frame: CGRect(x: margin, y: margin/2, width: bounds.width - margin*2, height: sectionHeight*(2/3)))
        medNameLabel.text = medicationName
        medNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: margin)
        medNameLabel.textColor = #colorLiteral(red: 0.6396280484, green: 0.6459609993, blue: 0.6459609993, alpha: 1)
        self.addSubview(medNameLabel)
        
        // Yellow line
        let underline = UIBezierPath(rect: CGRect(x: 0, y: margin/1.2 + sectionHeight/2, width: bounds.width, height: sectionHeight*(1/9)))
        #colorLiteral(red: 1, green: 0.9764705882, blue: 0.6784313725, alpha: 1).setFill()
        underline.fill()
        
        // Next dose
        let nextLabel = UILabel(frame: CGRect(x: margin, y: margin/2 + sectionHeight/1.3+margin*0.1, width: bounds.width - margin*2, height: sectionHeight/2))
        nextLabel.text = "Next dose"
        nextLabel.font = UIFont(name: "HelveticaNeue-Medium", size: margin*0.9)
        nextLabel.textColor = #colorLiteral(red: 0.7320227859, green: 0.7320227859, blue: 0.7320227859, alpha: 1)
        self.addSubview(nextLabel)
        
        #colorLiteral(red: 0.8690950428, green: 0.8690950428, blue: 0.8690950428, alpha: 1).setFill()
        UIRectFill(CGRect(x: margin, y: margin/2 + sectionHeight*1.37, width: sectionHeight/3, height: sectionHeight/3))
        
        let nextInfoLabel = UILabel(frame: CGRect(x: margin + sectionHeight/2, y: margin/2 + sectionHeight*1.28, width: bounds.width - (margin*2 + sectionHeight/2), height: sectionHeight/2))
        nextInfoLabel.text = nextDose
        nextInfoLabel.textColor = #colorLiteral(red: 0.7320227859, green: 0.7320227859, blue: 0.7320227859, alpha: 1)
        self.addSubview(nextInfoLabel)
        
        // Prev dose
        let prevLabel = UILabel(frame: CGRect(x: margin, y: sectionHeight*2, width: bounds.width - margin*2, height: sectionHeight/2))
        prevLabel.text = "Last dose"
        prevLabel.font = UIFont(name: "HelveticaNeue-Medium", size: margin*0.9)
        prevLabel.textColor = #colorLiteral(red: 0.7320227859, green: 0.7320227859, blue: 0.7320227859, alpha: 1)
        self.addSubview(prevLabel)
        
        prevTaken ? #colorLiteral(red: 0.8270349086, green: 0.9667718081, blue: 0.7583140113, alpha: 1).setFill() : #colorLiteral(red: 1, green: 0.7229301274, blue: 0.7303549193, alpha: 1).setFill()
        UIRectFill(CGRect(x: margin, y: margin/2 + sectionHeight*2.37, width: sectionHeight/3, height: sectionHeight/3))
        
        let prevInfoLabel = UILabel(frame: CGRect(x: margin + sectionHeight/2, y: margin/2 + sectionHeight*2.28, width: bounds.width - (margin*2 + sectionHeight/2), height: sectionHeight/2))
        prevInfoLabel.text = prevDose
        prevInfoLabel.textColor = #colorLiteral(red: 0.7320227859, green: 0.7320227859, blue: 0.7320227859, alpha: 1)
        self.addSubview(prevInfoLabel)
        
        
    }

}

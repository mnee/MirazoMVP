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
        
        setNeedsDisplay() // Potentially not necessary
        
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
        medNameLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addSubview(medNameLabel)
        
        // Yellow line
        let underline = UIBezierPath(rect: CGRect(x: 0, y: margin/2 + sectionHeight*(7/9), width: bounds.width, height: sectionHeight*(1/9)))
        #colorLiteral(red: 0.9994240403, green: 0.9237047236, blue: 0, alpha: 0.8530875428).setFill()
        underline.fill()
        
        // Next dose
        let nextLabel = UILabel(frame: CGRect(x: margin, y: margin/2 + sectionHeight, width: bounds.width - margin*2, height: sectionHeight/2))
        nextLabel.text = "Next dose"
        nextLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addSubview(nextLabel)
        
        #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).setFill()
        UIRectFill(CGRect(x: margin, y: margin/2 + sectionHeight*1.5, width: sectionHeight/2, height: sectionHeight/2))
        
        let nextInfoLabel = UILabel(frame: CGRect(x: margin*2 + sectionHeight/2, y: margin/2 + sectionHeight*1.5, width: bounds.width - (margin*2 + sectionHeight/2), height: sectionHeight/2))
        nextInfoLabel.text = nextDose
        nextInfoLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addSubview(nextInfoLabel)
        
        // Prev dose
        let prevLabel = UILabel(frame: CGRect(x: margin, y: sectionHeight*2, width: bounds.width - margin*2, height: sectionHeight/2))
        prevLabel.text = "Last dose"
        prevLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addSubview(prevLabel)
        
        prevTaken ? #colorLiteral(red: 1, green: 0.5, blue: 0.5373643901, alpha: 1).setFill() : #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1).setFill()
        UIRectFill(CGRect(x: margin, y: margin/2 + sectionHeight*2.5, width: sectionHeight/2, height: sectionHeight/2))
        
        let prevInfoLabel = UILabel(frame: CGRect(x: margin*2 + sectionHeight/2, y: margin/2 + sectionHeight*2.5, width: bounds.width - (margin*2 + sectionHeight/2), height: sectionHeight/2))
        prevInfoLabel.text = prevDose
        prevInfoLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addSubview(prevInfoLabel)
        
        
    }

}

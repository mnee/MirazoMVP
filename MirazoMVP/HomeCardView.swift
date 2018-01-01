//
//  HomeCardView.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 1/1/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class HomeCardView: UIView {

    var text: String
    var color: UIColor
    var image: UIImage
    
    init(_ text: String, _ color: UIColor, _ image: UIImage, _ frame: CGRect) {
        self.text = text
        self.color = color
        self.image = image
        
        super.init(frame: CGRect.zero)
        self.frame = frame
        
        setNeedsDisplay() // Potentially not necessary
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func draw(_ rect: CGRect) {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        
        // Base rounded card
        let roundedRect = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height), cornerRadius: cornerRadius)
        // roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
        
        // Teaser text
        let teaserLabel = UILabel(frame: CGRect(x: margin, y: margin, width: bounds.width - margin*2, height: margin*4))
        teaserLabel.text = text
        teaserLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addSubview(teaserLabel)
        
    }
}



extension HomeCardView {
    struct SizeRatio {
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let marginToBounds: CGFloat = 0.05
    }

    var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    var margin: CGFloat {
        return bounds.size.width * SizeRatio.marginToBounds
    }
}

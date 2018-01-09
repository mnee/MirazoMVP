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
    var image: UIImage?
    
    init(_ text: String, _ color: UIColor, _ image: UIImage?, _ frame: CGRect) {
        self.text = text
        self.color = color
        self.image = image
        
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
        
        // Teaser text
        // TODO: Set font programatically
        let teaserLabel = UILabel(frame: CGRect(x: margin, y: margin/2, width: bounds.width - margin*2, height: margin*2))
        teaserLabel.text = text
        teaserLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.addSubview(teaserLabel)
        
        let underline = UIBezierPath(rect: CGRect(x: 0, y: margin*2.5, width: bounds.width, height: margin/4))
        color.setFill()
        underline.fill()
        
        image?.draw(in: CGRect(x: margin, y: margin*3, width: bounds.width - margin*2, height: bounds.height - margin*3))
    }
}

// TODO: Fix margin to be more representative and easily changable. Code assumes on value being 0.05
extension UIView {
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

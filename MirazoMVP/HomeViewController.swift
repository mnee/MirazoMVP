//
//  HomeViewController.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 1/1/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
   
    let height: CGFloat = 700.0
    var margin: CGFloat {
        get {
            return height*0.03
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navBar = self.navigationController?.navigationBar {
            navBar.barTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            // TODO: Set name from core data
            self.navigationItem.title = "Welcome back Mischa!"
            // TODO: Make title bolder, left align?
            navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        
        let width = self.view.bounds.width
        scrollView.contentSize = CGSize(width: width, height: height)
        scrollView.backgroundColor = #colorLiteral(red: 0.9333306347, green: 0.9333306347, blue: 0.9333306347, alpha: 1)
       
        let medicationTeaser = HomeCardView("Keep up with your medication", #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), UIImage(), CGRect(x: width*0.05, y: margin, width: width*0.9, height: height*0.2125))
        let physicianTeaser = HomeCardView("Contact your physician", #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), UIImage(), CGRect(x: width*0.05, y: margin*2+height*0.2125, width: width*0.9, height: height*0.2125))
        let chatbotTeaser = HomeCardView("Log your day", #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), UIImage(), CGRect(x: width*0.05, y: margin*3+height*2*0.2125, width: width*0.9, height: height*0.2125))
        let graphTeaser = HomeCardView("Track your progress", #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), UIImage(), CGRect(x: width*0.05, y: margin*4+height*3*0.2125, width: width*0.9, height: height*0.2125))
        
        // TODO: Add tap gestures to cards
        
        scrollView.addSubview(medicationTeaser)
        scrollView.addSubview(physicianTeaser)
        scrollView.addSubview(chatbotTeaser)
        scrollView.addSubview(graphTeaser)
    }

}

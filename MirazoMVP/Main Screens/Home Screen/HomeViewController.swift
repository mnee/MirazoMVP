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
       
        let medicationTeaser = HomeCardView("Keep up with your medication", #colorLiteral(red: 1, green: 0.9764705882, blue: 0.6784313725, alpha: 1), UIImage(named: "MedicationCalendar"), CGRect(x: width*0.05, y: margin, width: width*0.9, height: height*0.2125))
        let physicianTeaser = HomeCardView("Contact your physician", #colorLiteral(red: 0.9803921569, green: 0.6352941176, blue: 0.6901960784, alpha: 1), UIImage(named: "PhysicianChat"), CGRect(x: width*0.05, y: margin*2+height*0.2125, width: width*0.9, height: height*0.2125))
        let graphTeaser = HomeCardView("Track your progress", #colorLiteral(red: 0.6941176471, green: 0.9176470588, blue: 0.6274509804, alpha: 1), UIImage(named: "ProgressGraph"), CGRect(x: width*0.05, y: margin*3+height*2*0.2125, width: width*0.9, height: height*0.2125))
        let chatbotTeaser = HomeCardView("Log your day", #colorLiteral(red: 0.5672459023, green: 0.9176470588, blue: 1, alpha: 1), nil, CGRect(x: width*0.05, y: margin*4+height*3*0.2125, width: width*0.9, height: height*0.2125))
        
        // Potentially taps should be added in HomeCardView
        let medTap = UITapGestureRecognizer(target: self, action: #selector(medSegue))
        let physTap = UITapGestureRecognizer(target: self, action: #selector(physSegue))
        let graphTap = UITapGestureRecognizer(target: self, action: #selector(graphSegue))
        let chatTap = UITapGestureRecognizer(target: self, action: #selector(chatSegue))
        
        medicationTeaser.addGestureRecognizer(medTap)
        physicianTeaser.addGestureRecognizer(physTap)
        graphTeaser.addGestureRecognizer(graphTap)
        chatbotTeaser.addGestureRecognizer(chatTap)
        
        scrollView.addSubview(medicationTeaser)
        scrollView.addSubview(physicianTeaser)
        scrollView.addSubview(graphTeaser)
        scrollView.addSubview(chatbotTeaser)
    }
    
    // TODO: Get rid of repetitive tap gesture segue code and switch to one func with switch
    @objc func medSegue() {
        //self.parent?.parent?.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }
    @objc func physSegue() {
        
    }
    @objc func graphSegue() {
        
    }
    @objc func chatSegue() {
        
    }

}

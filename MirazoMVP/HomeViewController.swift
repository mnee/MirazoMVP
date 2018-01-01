//
//  HomeViewController.swift
//  MirazoMVP
//
//  Created by Mischa Nee on 1/1/18.
//  Copyright © 2018 Mischa Nee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var medicationTeaser: UIView!
    @IBOutlet weak var physicianTeaser: UIView!
    @IBOutlet weak var chatbotTeaser: UIView!
    @IBOutlet weak var graphTeaser: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Replace with name loaded from core data
        self.title = "Welcome back Mischa!"
        medicationTeaser.addSubview(HomeCardView("Keep up with your medication", #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), UIImage(), medicationTeaser.bounds))
//        physicianTeaser.addSubview(HomeCardView("Contact your physician", #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), UIImage(), physicianTeaser.bounds))
//        chatbotTeaser.addSubview(HomeCardView("Log your day", #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), UIImage(), chatbotTeaser.bounds))
//        graphTeaser.addSubview(HomeCardView("Track your progress", #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), UIImage(), graphTeaser.bounds))
    }

}

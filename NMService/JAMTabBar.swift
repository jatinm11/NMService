//
//  JAMTabBar.swift
//  NMService
//
//  Created by Jatin Menghani on 03/04/21.
//

import UIKit

class JAMTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()

        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 2.5;
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.2;
    }
}

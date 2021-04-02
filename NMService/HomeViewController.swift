//
//  HomeViewController.swift
//  NMService
//
//  Created by Jatin Menghani on 02/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkController.shared.getDashboardData { (result) in
            switch result {
            case .success(let dashData):
                print(dashData.weekServiceData.totalService)
                
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}

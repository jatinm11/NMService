//
//  ServiceDetailCell.swift
//  NMService
//
//  Created by Jatin Menghani on 05/04/21.
//

import UIKit

class ServiceDetailCell: UITableViewCell {
    
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var serviceStatusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var IndicatorView: UIView!
    
    
    var serviceItem: Service? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let serviceItem = self.serviceItem {
            DispatchQueue.main.async {
                self.customerNameLabel.text = serviceItem.customerName
                self.serviceStatusLabel.text = serviceItem.serviceStatusStr
                self.dateLabel.text = serviceItem.serviceDate.appDate()
                
                if serviceItem.serviceStatusStr.lowercased() == "closed" {
                    self.IndicatorView.backgroundColor = UIColor(named: "appGreen")!
                    self.serviceStatusLabel.textColor = UIColor(named: "appGreen")!
                }
            }
        }
    }
}

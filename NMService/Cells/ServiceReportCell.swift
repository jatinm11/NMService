//
//  ServiceReportCell.swift
//  NMService
//
//  Created by Jatin Menghani on 06/04/21.
//

import UIKit

class ServiceReportCell: UITableViewCell {
        
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var faultTypeLabel: UILabel!
    
    @IBOutlet weak var serviceTypeLabel: UILabel!
    @IBOutlet weak var technicianNameLabel: UILabel!
    @IBOutlet weak var assignedByLabel: UILabel!
    @IBOutlet weak var statusRemarksLabel: UILabel!
    
    
    
    var serviceItem: Service? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        if let serviceItem = self.serviceItem {
            DispatchQueue.main.async {
                self.addressLabel.text = serviceItem.customerName
                self.productNameLabel.text = serviceItem.productName
                self.addressTextView.text = serviceItem.customerAddress
                self.faultTypeLabel.text = serviceItem.defectType?.capitalized ?? "None"
                self.serviceTypeLabel.text = "Paid"
                self.technicianNameLabel.text = serviceItem.assignedTo?.capitalized ?? "None"
                self.assignedByLabel.text = serviceItem.assignedBy?.capitalized ?? "None"
                self.statusRemarksLabel.text = serviceItem.serviceStatusStr.capitalized
            }
        }
    }
}

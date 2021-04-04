//
//  ServiceSummaryCell.swift
//  NMService
//
//  Created by Jatin Menghani on 03/04/21.
//

import UIKit

class ServiceSummaryCell: UITableViewCell {

    @IBOutlet weak var totalRequestsLabel: UILabel!
    @IBOutlet weak var serviceClosedLabel: UILabel!
    @IBOutlet weak var servicePaidLabel: UILabel!
    @IBOutlet weak var serviceFreeLabel: UILabel!
    @IBOutlet weak var servicePendingLabel: UILabel!
    @IBOutlet weak var serviceInProgressLabel: UILabel!
    
    @IBOutlet weak var fullReportButton: UIButton!
    
    var serviceObject: WeekServiceData? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        if let serviceObject = self.serviceObject {
            DispatchQueue.main.async {
                self.totalRequestsLabel.text = serviceObject.totalService.withCommas()
                self.serviceClosedLabel.text = serviceObject.totalServiceClosed.withCommas()
                self.servicePaidLabel.text = serviceObject.totalServicePaid.withCommas()
                self.serviceFreeLabel.text = serviceObject.totalServiceFree.withCommas()
                self.servicePendingLabel.text = serviceObject.totalServicePending.withCommas()
                self.serviceInProgressLabel.text = serviceObject.totalServiceInProgress.withCommas()
            }
        }
    }
}

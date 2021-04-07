//
//  DateCell.swift
//  NMService
//
//  Created by Jatin Menghani on 03/04/21.
//

import UIKit

protocol DateCellDelegate {
    func dateButtonTapped()
}

class DateCell: UITableViewCell {

    var dateCellDelegate: DateCellDelegate!
    
    @IBOutlet weak var dateButton: UIButton!
    
    @IBAction func dateButtonTapped(_ sender: Any) {
        dateCellDelegate.dateButtonTapped()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateButton.contentHorizontalAlignment = .left
    }
}

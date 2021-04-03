//
//  DateCell.swift
//  NMService
//
//  Created by Jatin Menghani on 03/04/21.
//

import UIKit

class DateCell: UITableViewCell {

    @IBOutlet weak var dateButton: UIButton!
    @IBAction func dateButtonTapped(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateButton.contentHorizontalAlignment = .left
    }
}

//
//  HomeDateCell.swift
//  NMService
//
//  Created by Jatin Menghani on 03/04/21.
//

import UIKit

class HomeDateCell: UITableViewCell {
    
    @IBOutlet weak var homeDateButton: UIButton!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        homeDateButton.contentHorizontalAlignment = .left
    }
    
    @IBAction func homeDateButtonTapped(_ sender: Any) {
        
    }
}

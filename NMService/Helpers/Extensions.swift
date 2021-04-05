//
//  Extensions.swift
//  NMService
//
//  Created by Jatin Menghani on 03/04/21.
//

import Foundation

extension Int{
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}

extension String {
    
    func appDate() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: self)
        
        let dateFormatterForApp = DateFormatter()
        dateFormatterForApp.dateFormat = "MMMM dd"
        return dateFormatterForApp.string(from: date!)
    }
}

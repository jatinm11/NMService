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

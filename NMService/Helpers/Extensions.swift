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
    
    func dateTodayServerFormat() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString
    }
    
    func convertToServerFormat() -> String {
        let dateFormatterFromServer = DateFormatter()
        dateFormatterFromServer.dateFormat = "MMMM dd, yyyy"
        let dateFromServer = dateFormatterFromServer.date(from: self)
        
        let dateFormatterForApp = DateFormatter()
        dateFormatterForApp.dateFormat = "dd-MM-yyyy"
        
        return dateFormatterForApp.string(from: dateFromServer ?? Date())
    }
    
    func nucleiFormatWithoutYear() -> String {
        let dateFormatterFromServer = DateFormatter()
        dateFormatterFromServer.dateFormat = "yyyy-MM-dd"
        let dateFromServer = dateFormatterFromServer.date(from: self)
        
        let dateFormatterForApp = DateFormatter()
        dateFormatterForApp.dateFormat = "MMMM dd"
        
        return dateFormatterForApp.string(from: dateFromServer ?? Date())
    }
    
    func nucleiFormat() -> String {
        
        let dateFormatterFromServer = DateFormatter()
        dateFormatterFromServer.dateFormat = "dd-MM-yyyy"
        let dateFromServer = dateFormatterFromServer.date(from: self)
        
        let dateFormatterForApp = DateFormatter()
        dateFormatterForApp.dateFormat = "MMMM dd, yyyy"
        
        return dateFormatterForApp.string(from: dateFromServer ?? Date())
    }
}

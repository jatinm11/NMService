//
//  JAMError.swift
//  NMService
//
//  Created by Jatin Menghani on 02/04/21.
//

import Foundation

enum JAMError: String, Error {
    case noDataRecieved = "No Data Recieved"
    case decodingError = "Unable to decode"
    case completionBlockError = ""
}

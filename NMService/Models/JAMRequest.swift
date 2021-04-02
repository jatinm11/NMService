//
//  JAMRequest.swift
//  NMService
//
//  Created by Jatin Menghani on 02/04/21.
//

import Foundation

struct JAMRequest {
    
    var endPoint: EndPoint.RawValue
    var method: String = "POST"
    var body: Data?
    
}

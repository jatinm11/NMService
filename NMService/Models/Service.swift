//
//  Service.swift
//  NMService
//
//  Created by Jatin Menghani on 04/04/21.
//

import Foundation

struct Service: Codable {

    let defectType: String?
    let productName: String
    let productCount: Double
    let customerName: String
    let customerAddress: String
    let serviceDate: String
    let createdBy: String
    let serviceStatusStr: String
    let assignedTo: String?
    let assignedTime: String?
    let assignedBy: String?
    
    enum CodingKeys: String, CodingKey {
        case defectType = "defect_type"
        case productName = "product_name"
        case productCount = "product_count"
        case customerName = "customer_name"
        case customerAddress = "customer_address"
        case serviceDate = "service_date"
        case createdBy = "created_by"
        case serviceStatusStr = "service_status_str"
        case assignedTo = "assigned_to"
        case assignedTime = "assigned_time"
        case assignedBy = "assigned_by"
    }
}

struct ServiceListResponse: Codable {
    let data: [Service]
}

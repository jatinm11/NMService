//
//  DashboardData.swift
//  NMService
//
//  Created by Jatin Menghani on 02/04/21.
//

import Foundation

struct DashboardDataResponse: Codable {
    let status: Bool
    let data: DashboardData
}

struct DashboardData: Codable {
    
    let totalSales: Int
    let totalCustomers: Int
    let weekServiceData: WeekServiceData

    enum CodingKeys: String, CodingKey {
        case totalSales = "total_sales"
        case totalCustomers = "total_customers"
        case weekServiceData = "week_service_data"
    }
}

struct WeekServiceData: Codable {
    
    let totalService: Int
    let totalServicePending: Int
    let totalServiceClosed: Int
    let totalServiceFree: Int
    let totalServicePaid: Int
    let totalServiceInProgress: Int
    
    enum CodingKeys: String, CodingKey {
        case totalService = "total_service"
        case totalServicePending = "total_service_pending"
        case totalServiceClosed = "total_service_closed"
        case totalServiceFree = "total_service_free"
        case totalServicePaid = "total_service_paid"
        case totalServiceInProgress = "total_service_inprog"
    }
}

//
//  NetworkController.swift
//  NMService
//
//  Created by Jatin Menghani on 02/04/21.
//

import Foundation

struct NetworkController {
    
    static let shared = NetworkController()
 
    let baseURL = "https://nm1.allsoft.co"
    
    func callAPIWith(request: JAMRequest, completion: @escaping(Data?, Error?) -> Void) {
        
        let urlComponent = URLComponents(string: "\(baseURL)\(request.endPoint)")!
        
        print(urlComponent.url ?? "No URL")
        
        var urlRequest = URLRequest(url: urlComponent.url!)
        urlRequest.httpBody = request.body
        urlRequest.httpMethod = request.method
        urlRequest.addValue("11b2f8c045e5ba1a402f0e9a073691d4870d9c1425531a85b784b0ffb73a1ef9", forHTTPHeaderField: "token")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask =  URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                print("Error in callAPI Method -> \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            if let data = data {
                completion(data, nil)
            }
        }
        
        dataTask.resume()
    }
    
    func getDashboardData(completion: @escaping(Result<DashboardData, JAMError>) -> Void) {
        
        let bodyDict: [String : Any] = ["from_date": "01-04-2021", "to_date": "02-04-2021"]
        let bodyData = try? JSONSerialization.data(withJSONObject: bodyDict, options: [])
        
        let request = JAMRequest(endPoint: EndPoint.dashboardData.rawValue, body: bodyData)
        
        callAPIWith(request: request) { (data, error) in
            if let error = error {
                print("Error in get production data -> \(error.localizedDescription)")
                completion(.failure(.completionBlockError))
                return
            }
            
            guard let data = data else { completion(.failure(.noDataRecieved)); return }

            print(String(data: data, encoding: .utf8) ?? "")
            
            do {
                let decoder = JSONDecoder()
                let dashboardDataResponse = try decoder.decode(DashboardDataResponse.self, from: data)
                completion(.success(dashboardDataResponse.data))
            }
            catch {
                completion(.failure(.decodingError))
            }
        }
    }
}


enum EndPoint: String {
    case dashboardData = "/api/reports/dashboardData"
    case technicianList = "/api/masterlist/GetMasterList"
    case serviceList = "/api/reports/serviceListForTechnician"
}

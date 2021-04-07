//
//  ServiceListViewController.swift
//  NMService
//
//  Created by Jatin Menghani on 05/04/21.
//

import UIKit

class ServiceListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var serviceList: [Service] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        registerCells()
        callAPI()
    }
    
    func setupViews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }

    func registerCells() {
        self.tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        self.tableView.register(UINib(nibName: "DateCell", bundle: nil), forCellReuseIdentifier: "dateCell")
        self.tableView.register(UINib(nibName: "ServiceFilterCell", bundle: nil), forCellReuseIdentifier: "serviceFilterCell")
        self.tableView.register(UINib(nibName: "ServiceDetailCell", bundle: nil), forCellReuseIdentifier: "serviceDetailCell")
    }
    
    func callAPI() {
        NetworkController.shared.getServiceList { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                return
                
            case .success(let serviceList):
                DispatchQueue.main.async {
                    self.serviceList = serviceList
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    class func controller() -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "serviceListVC") as! ServiceListViewController
        return vc
    }
}

extension ServiceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2:
            return 1
            
        case 3:
            return self.serviceList.count
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            headerCell.headerLabel.text = "Service List"
            return headerCell
        
        case 1:
            let dateCell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! DateCell
            dateCell.dateButton.contentHorizontalAlignment = .left
            dateCell.dateButton.setTitle("Today, 03 April", for: .normal)
            dateCell.dateButton.isUserInteractionEnabled = false
            return dateCell
            
        case 2:
            let serviceFilterCell = tableView.dequeueReusableCell(withIdentifier: "serviceFilterCell", for: indexPath) as! ServiceFilterCell
            serviceFilterCell.totalItemsLabel.text = "\(self.serviceList.count) Total Items"
            return serviceFilterCell

        case 3:
            let serviceDetailCell = tableView.dequeueReusableCell(withIdentifier: "serviceDetailCell", for: indexPath) as! ServiceDetailCell
            serviceDetailCell.indexLabel.text = "\(indexPath.row + 1)"
            serviceDetailCell.serviceItem = self.serviceList[indexPath.row]
            return serviceDetailCell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0,2:
            return 50
        case 1:
            return 35
        case 3:
            return 100
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationItem.title = "Service List"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationItem.title = ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedServiceItem = self.serviceList[indexPath.row]
        self.navigationController?.pushViewController(ServiceReportViewController.controller(serviceItem: selectedServiceItem), animated: true)
    }
}

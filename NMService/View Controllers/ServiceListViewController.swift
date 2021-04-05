//
//  ServiceListViewController.swift
//  NMService
//
//  Created by Jatin Menghani on 05/04/21.
//

import UIKit

class ServiceListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        registerCells()
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
    }
    
    class func controller() -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "serviceListVC") as! ServiceListViewController
        return vc
    }
}

extension ServiceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2:
            return 1
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
            return serviceFilterCell

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
        default:
            return 0
        }
    }
}

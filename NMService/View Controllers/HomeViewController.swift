//
//  HomeViewController.swift
//  NMService
//
//  Created by Jatin Menghani on 02/04/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var serviceDashboardData: WeekServiceData?
    
    var selectedDateString = "Today, \(String().dateTodayServerFormat().nucleiFormatWithoutYear())"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        registerCells()
        
        NetworkController.shared.getDashboardDataFor { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                return
                
            case .success(let dashboardData):
                DispatchQueue.main.async {
                    self.serviceDashboardData = dashboardData.weekServiceData
                    self.tableView.reloadData()
                }
            }
        }
    }

    func setupViews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    
        let saleEntryButton = UIButton(type: .custom)
        saleEntryButton.setImage(UIImage(systemName: "plus"), for: .normal)
        saleEntryButton.tintColor = .black
                
        let notificationButton = UIButton(type: .custom)
        notificationButton.setImage(UIImage(systemName: "bell"), for: .normal)
        notificationButton.tintColor = .black

        let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
        let barButtons: [UIBarButtonItem] = [UIBarButtonItem(customView: saleEntryButton), spacer, spacer,
                                             UIBarButtonItem(customView: notificationButton)]
        
        self.navigationItem.rightBarButtonItems = barButtons
    }
    
    func registerCells() {
        self.tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        self.tableView.register(UINib(nibName: "DateCell", bundle: nil), forCellReuseIdentifier: "dateCell")
        self.tableView.register(UINib(nibName: "HomeDateCell", bundle: nil), forCellReuseIdentifier: "homeDateCell")
        self.tableView.register(UINib(nibName: "ServiceSummaryCell", bundle: nil), forCellReuseIdentifier: "serviceSummaryCell")
        self.tableView.register(UINib(nibName: "InstallationSummaryCell", bundle: nil), forCellReuseIdentifier: "installationSummaryCell")
    }
    
    @objc func fullReportButtonTapped() {
        self.navigationController?.pushViewController(ServiceListViewController.controller(selectedDate: self.selectedDateString), animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2,3,4,5:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! HeaderCell
            headerCell.headerLabel.text = "Home"
            return headerCell
        
        case 1:
            let dateCell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! DateCell
            dateCell.dateButton.contentHorizontalAlignment = .left
            dateCell.dateButton.setTitle(self.selectedDateString, for: .normal)
            dateCell.dateCellDelegate = self
            return dateCell

        case 2:
            let homeDateCell = tableView.dequeueReusableCell(withIdentifier: "homeDateCell", for: indexPath) as! HomeDateCell
            homeDateCell.homeDateButton.contentHorizontalAlignment = .left
            homeDateCell.homeDateButton.setTitle("Service Summary", for: .normal)
            return homeDateCell
            
        case 3:
            let serviceSummaryCell = tableView.dequeueReusableCell(withIdentifier: "serviceSummaryCell", for: indexPath) as! ServiceSummaryCell
            serviceSummaryCell.serviceObject = self.serviceDashboardData
            serviceSummaryCell.fullReportButton.addTarget(self, action: #selector(fullReportButtonTapped), for: .touchUpInside)
            return serviceSummaryCell

        case 4:
            let homeDateCell = tableView.dequeueReusableCell(withIdentifier: "homeDateCell", for: indexPath) as! HomeDateCell
            homeDateCell.homeDateButton.contentHorizontalAlignment = .left
            homeDateCell.homeDateButton.setTitle("Installation Summary", for: .normal)
            return homeDateCell
            
        case 5:
            let installationSummaryCell = tableView.dequeueReusableCell(withIdentifier: "installationSummaryCell", for: indexPath) as! InstallationSummaryCell
            return installationSummaryCell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0,4:
            return 50
        case 1:
            return 35
        case 2:
            return 40
        case 3,5:
            return 330
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationItem.title = "Home"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationItem.title = ""
        }
    }
}

extension HomeViewController: DateCellDelegate, DatePickerDelegate {
    
    func didSelect(date: String) {
        self.tabBarController?.tabBar.isUserInteractionEnabled = true
        
        NetworkController.shared.getDashboardDataFor(date: date) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                return
                
            case .success(let dashboardData):
                DispatchQueue.main.async {
                    self.selectedDateString = date.nucleiFormat()
                    self.serviceDashboardData = dashboardData.weekServiceData
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func didCancelSelection() {
        self.tabBarController?.tabBar.isUserInteractionEnabled = true
    }
    
    func showNewPicker() {
        let vc = UIStoryboard(name: "Popups", bundle: nil).instantiateViewController(withIdentifier: "datePickerVC") as! DatePickerViewController
        vc.datePickerDelegate = self
        self.tabBarController?.tabBar.isUserInteractionEnabled = false
        self.present(vc, animated: true, completion: nil)
    }
    
    func dateButtonTapped() {
        showNewPicker()
    }
}

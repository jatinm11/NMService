//
//  HomeViewController.swift
//  NMService
//
//  Created by Jatin Menghani on 02/04/21.
//

import UIKit

class HomeViewController: UIViewController {

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
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1:
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
            dateCell.dateButton.setTitle("Good Evening, Boss 👋", for: .normal)
            dateCell.dateButton.isUserInteractionEnabled = false
            return dateCell

        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 50
        case 1:
            return 40
        default:
            return 0
        }
    }
}

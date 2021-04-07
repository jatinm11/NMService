//
//  DatePickerViewController.swift
//  NMService
//
//  Created by Jatin Menghani on 07/04/21.
//

import UIKit

protocol DatePickerDelegate {
    func didSelect(date: String)
    func didCancelSelection()
}

class DatePickerViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var datePickerDelegate: DatePickerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.autoresizingMask = .flexibleRightMargin
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
            
        let selectedDateString = formatter.string(from: datePicker.date)
        datePickerDelegate.didSelect(date: selectedDateString)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        datePickerDelegate.didCancelSelection()
        self.dismiss(animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == datePicker {
            print(row)
            print(component)
        }
    }
}

extension DatePickerViewController {
    
    class func controller() -> UIViewController {
        let vc = UIStoryboard(name: "Popups", bundle: nil).instantiateViewController(withIdentifier: "datePickerVC") as! DatePickerViewController
        return vc
    }
}

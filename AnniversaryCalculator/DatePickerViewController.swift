//
//  DatePickerViewController.swift
//  AnniversaryCalculator
//
//  Created by 이중원 on 2022/07/14.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var DatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 14.0, *) {
            DatePicker.preferredDatePickerStyle = .inline
        } else {
            DatePicker.preferredDatePickerStyle = .wheels
        }
        
    }


}

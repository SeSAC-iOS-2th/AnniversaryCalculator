//
//  DatePickerViewController.swift
//  AnniversaryCalculator
//
//  Created by 이중원 on 2022/07/14.
//

import UIKit

class DatePickerViewController: UIViewController {
        
    @IBOutlet weak var DatePicker: UIDatePicker!
        
    
    @IBOutlet var afterLabelCollection: [UILabel]!
    @IBOutlet var showAfterLabelCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var topNum: Int = 1
        var centerNum: Int = 1
        
//        if #available(iOS 14.0, *) {
//            DatePicker.preferredDatePickerStyle = .inline
//        } else {
//            DatePicker.preferredDatePickerStyle = .wheels
//        }
        
        // 이미지 뷰 상단의 label D+N일 표시
        for label in afterLabelCollection {
            
            label.text = "D+\(topNum*100)"
            label.font = UIFont.systemFont(ofSize: 17)
            topNum += 1
        }
        
        // 이미지 뷰 중앙의 label 초기화
        // calendar 이용
        // 해결해야 할 부분: 날짜의 format ex)7월 -> 07월
        // Calendar와 DateFormatter를 함께 이용하면 더 많은 적용이 가능!!
        for label in showAfterLabelCollection {
            
            let now: Date! = Date()
            let calendar: Calendar! = Calendar.current
            let dateCalculate: Date! = calendar.date(byAdding: .day, value: +(centerNum*100), to: now)
            
            let dateComponents = calendar.dateComponents([.year, .month, .day], from: dateCalculate)
            
            label.text = "\(String(describing: dateComponents.year!))일\n\(String(describing: dateComponents.month!))월 \(String(describing: dateComponents.day!))일"
            
            centerNum += 1
            
            
        }
        
    }
    
    
    // date Picker 값이 변할 때 마다 이미지 뷰 중앙의 label 값 변경
    // dateFormatter 이용
    @IBAction func datePickerEvent(_ sender: UIDatePicker) {
        
        var num: Int = 1
        
        let dateView = sender
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy년\nMM월 dd일"
        
        
        for label in showAfterLabelCollection {
            // TimeInterval은 초 단위로 적용
            // 1분 = 60
            // 1시간 = 3600
            // 1일 = 86400
            label.text = formatter.string(from: dateView.date.addingTimeInterval(TimeInterval(num*100*86400)))
            num += 1
        }
    }
    
}

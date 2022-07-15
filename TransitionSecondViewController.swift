//
//  TransitionSecondViewController.swift
//  AnniversaryCalculator
//
//  Created by 이중원 on 2022/07/15.
//

import UIKit

class TransitionSecondViewController: UIViewController {

    @IBOutlet weak var mottoTextView: UITextView!
    /*
     1. 앱 켜면 데이터를 가지고 와서 텍스트 뷰에 보여주어야 함.
     2. 바뀐 데이터를 저장해주어야 함.
     => UserDefault
     
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TransitionSecondViewController", #function)
        
        
        if UserDefaults.standard.string(forKey: "nickname") != nil {
            //가져오기
            mottoTextView.text = UserDefaults.standard.string(forKey: "nickname")

        } else {
            //데이터가 없는 경우에 사용할 문구
            mottoTextView.text = "고래밥"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("TransitionSecondViewController", #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("TransitionSecondViewController", #function)
    }

    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        
        
        UserDefaults.standard.set(mottoTextView.text, forKey: "nickname")
        print("저장되었습니다!")
        
    }
    
}

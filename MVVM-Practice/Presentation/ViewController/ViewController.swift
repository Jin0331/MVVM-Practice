//
//  ViewController.swift
//  MVVM-Practice
//
//  Created by JinwooLee on 2/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView = View()
    let viewModel = ViewModel() // 비즈니스 로직을 수행하는 ViewModel. 즉, 모든 데이터는 viewModel로부터 가공되어 넘어온다.
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.outputResult.bind { value in
            self.mainView.resultLabel.text = value // outputResult의 text가 변경이 감지될 때마다 resultLabel을 수정하는 closure를 바인드. 여기서 outputResult는 input text가 변경될때 같이 변경된다.
        }
        
        mainView.userTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    
    }

    @objc func numberTextFieldChanged() {

        viewModel.inputText.text = mainView.userTextField.text!
        
    }

}


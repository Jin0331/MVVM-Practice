//
//  View.swift
//  MVVM-Practice
//
//  Created by JinwooLee on 2/22/24.
//

import UIKit
import Then
import SnapKit

class View : BaseView {
    
    let userTextField = UITextField().then { _ in}
    let resultLabel = UILabel()
    
    override func configureHierarchy() {
        addSubview(userTextField)
        addSubview(resultLabel)
    }
    
    override func configureLayout() {
        userTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(15)
            make.height.equalTo(30)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(userTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(userTextField)
            make.height.equalTo(30)
        }
    }
    
    override func configureView() {
        backgroundColor = .white
    }
}

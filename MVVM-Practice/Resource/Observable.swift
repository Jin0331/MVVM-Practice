//
//  Observable.swift
//  MVVM-Practice
//
//  Created by JinwooLee on 2/22/24.
//

import Foundation

class Observable {
    
    private var closure : ((String) -> Void)? // 값이 변화되었을 때, 어떤 동작을 할지 Function Type으로 설정.
    
    // text가 변경되었을 때(didSet), 입력받은 Function Type이 있을 경우, 현재의 text를 해당 closure로 동작한다
    var text : String {
        didSet {
            closure?(text)
        }
    }
    
    init(_ text : String) {
        self.text = text
    }
    
    func bind(_ closure : @escaping (String) -> Void) {
        
        closure(text) // 우선 입력받은 closure를 실행
        self.closure = closure // 입력받은 clousre를 등록한다. 이후, text가 변경될 때마다 해당 closure가 실행된다.
    }
    
}

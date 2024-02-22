//
//  Observable.swift
//  MVVM-Practice
//
//  Created by JinwooLee on 2/22/24.
//

import Foundation

class Observable<T> { // 제네릭을 사용하면 좀더 유동적으로 사용할 수 있따.
    
    // 2. value가 변하면 didSet에 의해 변경된 value 값을 갖고 listener 동작을 실행합니다.
    var value: T? {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    // 동작을 담아두는 클로저입니다. (실행 X)
    private var listener: ((T?) -> Void)?
    
    // 1. 이 함수가 호출이 되면 아래와 같은 작업을 실행
    func bind(_ listener: @escaping (T?) -> Void) {
        // completion에서 value의 값을 갖고 동작을 실행시킨다.
        listener(value)
        // 다음으로 위의 동작을 listener에 저장시킨다.
        self.listener = listener
    }
}

//
//  ViewModel.swift
//  MVVM-Practice
//
//  Created by JinwooLee on 2/22/24.
//

import Foundation

// UIkit이나 swiftUI 임포트 ㄴㄴ

class ViewModel {
    
    var inputText = Observable("") // 입력값의 observer 등록
    var outputResult = Observable("") // 반환값의 observer 등록
    
    init() {
        inputText.bind { value in  // 값이 변결될 때마다, validation(유효성 검사)을 실행한다.
            self.validation(value)
        }
    }
    
    // 입력받은 text의 유효성 검사를 담당하는 함수
    private func validation(_ text : String) {
        //1. 반값
        if text.isEmpty {
            outputResult.text =  "값을 입력해주세요"
        }
        
        //2. 문자열
        guard let num = Int(text) else {
            outputResult.text =  "숫자만 입력해주세요"
            return
        }
        
        //3. 숫자 쉼표
        if num > 0, num <= 1000000 {
            let format = NumberFormatter()
            format.numberStyle = .decimal
            let result = format.string(for: num)
            
            outputResult.text = result!
        } else {
            outputResult.text =  "100만원 이하로 입력해주세요."
        }
    }
    
}

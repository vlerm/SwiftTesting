//
//  TestViewModel.swift
//  SwiftTesting
//
//  Created by Вадим Лавор on 02.05.22.
//

import Foundation

class TestViewModel {
    
    var questions: [Question] = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20]
    var currentQuestionIndex = 0
    var maxQuestionIndex = 19
   
    func currentQuestion() -> Question {
        if currentQuestionIndex > questions.count - 1 {
            return questions[questions.count - 1]
        } else {
            return questions[currentQuestionIndex]
        }
    }
    
    func nextQuestionIndex() {
        currentQuestionIndex += 1
    }
}

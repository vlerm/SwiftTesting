//
//  QuestionBank.swift
//  SwiftTesting
//
//  Created by Вадим Лавор on 13.07.22.
//

import Foundation

var answers: [String] = []

let q1 = Question(question: "Можете ли вы объявить приватные члены в одном расширении и получить доступ к ним через другие расширения, если они находятся в это же файле?", answers: ["Да", "Нет"], rightAnswer: "Да", count: "1/20")
let q2 = Question(question: "Во время переопределения метода viewDidAppear() должны ли мы обращаться к суперклассу super.viewDidApper?", answers: ["Да", "Нет"], rightAnswer: "Да", count: "2/20")
let q3 = Question(question: "Как пишется проваливающийся инициализатор?", answers:  ["init?() {}","init?() {}", "init(?) {}"], rightAnswer: "init?() {}", count: "3/20")
let q4 = Question(question: "Что является основой поведенческих факторов?", answers: ["Управление поведением","Создание объектов", "Структурирование кода"], rightAnswer: "Управление поведением", count: "4/20")
let q5 = Question(question: "Мы обязаны писать override каждый раз, когда переопределяем требуемый инициализатор. Это так?", answers: ["Да","Нет"], rightAnswer: "Нет", count: "5/20")
let q6 = Question(question: "Универсальные функции используют заполнитель имени типа, как он традиционно записывается?", answers: ["T","(T)","<T>"], rightAnswer: "<T>", count: "6/20")
let q7 = Question(question: "Какой метод мы можем использовать для того, чтобы вручную обработать анимацию смены ориентации экрана?", answers: ["viewWillAppear()","viewWillTransition()","viewWillLayoutSubviews()"], rightAnswer: "viewWillTransition()", count: "7/20")
let q8 = Question(question: "Какими должны быть имена переменных?", answers: ["Универсальными","Односложными","Уникальными"], rightAnswer: "Уникальными", count: "8/20")
let q9 = Question(question: "Если экземпляр соответсвует протоколу, что вернет оператор is?", answers: ["ничего","false","true","nil"], rightAnswer: "true", count: "9/20")
let q10 = Question(question: "Что лежит в основе структурных паттернов?", answers: ["Структурирование кода","Управление поведением","Создание объектов"], rightAnswer: "Структурирование кода",count: "10/20")
let q11 = Question(question: "Какое ключевое слово обозначает слабую ссылку?", answers: ["unowned","weak","week","strong"], rightAnswer: "weak",count: "11/20")
let q12 = Question(question: "Какую инструкцию мы будем использовать для генерации ошибок?", answers: ["if","guard","throw","switch"], rightAnswer: "throw", count: "12/20")
let q13 = Question(question: "Если в коде не указать размер целого числа, каким оно будет?", answers: ["128","64","Согласно разрядности системы","32"], rightAnswer: "Согласно разрядности системы",count: "13/20")
let q14 = Question(question: "Сабскрипт может принимать только один входящий параметр, так ли это?", answers: ["Нет","Да"], rightAnswer: "Нет",count: "14/20")
let q15 = Question(question: "Изменяет ли приведение экземпляра или его значения?", answers: ["Да","Нет"], rightAnswer: "Нет",count: "15/20")
let q16 = Question(question: "Какой оператор передачи управления говорит циклу прекратить текущую итерацию и начать новую?", answers: ["return","continue","break","fallfrough"], rightAnswer: "continue",count: "16/20")
let q17 = Question(question: "Какой из типов Float/Double является знаковым (может хранить и положительные и отрицательные значения)?", answers: ["Оба типа","Double","Float"], rightAnswer: "Оба типа",count: "17/20")
let q18 = Question(question: "Должны ли вы завершать доступ к камере или другим системным ресурсам во время перехода приложения в фоновый (background) режим?", answers: ["Да","Нет"], rightAnswer: "Да",count: "18/20")
let q19 = Question(question: "Можем ли присваивать значение по умолчанию для элемента словаря, которое будет возвращаться при попытках обратиться по несуществующему ключу?", answers: ["Да","Нет"], rightAnswer: "Да",count: "19/20")
let q20 = Question(question: "Должны ли элементы внутри кортежа быть одного и того же типа?", answers: ["Да","Нет"], rightAnswer: "Нет",count: "20/20")

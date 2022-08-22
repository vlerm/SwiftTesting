//
//  ResultViewController.swift
//  SwiftTesting
//
//  Created by Вадим Лавор on 12.07.22.
//

import UIKit

class ResultViewController: UIViewController {
    
    enum ConstraintsOfResultPage {
        static let imageUnionHeigh: CGFloat = 200
        static let imageUnionWidth: CGFloat = 200
        static let imageUnionTop: CGFloat = 200
        static let centerX: CGFloat = 0
        static let restartButtonHeigh: CGFloat = 56
        static let restartButtonWidth: CGFloat = 311
        static let restartButtonTop: CGFloat = 228
        static let restartButtonBottom: CGFloat = -50
        static let resultLabelHeigh: CGFloat = 39
        static let resultLabelWidth: CGFloat = 311
        static let resultLabelTop: CGFloat = 50
        static let secondLabelHeigh: CGFloat = 66
        static let secondLabelWidth: CGFloat = 311
        static let secondLabelTop: CGFloat = 10
    }
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Твой результат: \(answers.count)/20"
        label.textAlignment = .center
        return label
    }()
    
    lazy var textResultLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Поздравляем, вы \(getGrateOfUser())!"
        label.textAlignment = .center
        return label
    }()
    
    private let unionImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "itest")
        view.contentMode = .center
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var restartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Eще раз", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 311, height: 56)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(restartButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        view.addSubview(restartButton)
        view.addSubview(unionImageView)
        view.addSubview(resultLabel)
        view.addSubview(textResultLabel)
    }
    
    override func viewWillLayoutSubviews() {
        self.imageUnionConstraints()
        self.buttonRestartConstraints()
        self.resultLabelConstraints()
        self.secondLabelConstraints()
    }
    
    @objc func restartButtonClicked() {
        answers.removeAll()
        self.navigationController?.pushViewController(TestViewController(), animated: true)
    }
    
    func getGrateOfUser() -> String {
        let correctAnswersCount = answers.count
        var grate = String()
        switch correctAnswersCount {
        case 0...9:
            grate = "Junior"
        case 10...16:
            grate = "Middle"
        case 17...20:
            grate = "Senior"
        default:
            print("error")
            break
        }
        return grate
    }
    
    private func imageUnionConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: unionImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.imageUnionHeigh),
            NSLayoutConstraint(item: unionImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.imageUnionWidth),
            NSLayoutConstraint(item: unionImageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: ConstraintsOfResultPage.imageUnionTop),
            NSLayoutConstraint(item: unionImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfResultPage.centerX)])
    }
    
    private func resultLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: resultLabel, attribute: .top, relatedBy: .equal, toItem: unionImageView, attribute: .bottom, multiplier: 1, constant: ConstraintsOfResultPage.resultLabelTop),
            NSLayoutConstraint(item: resultLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfResultPage.centerX),
            NSLayoutConstraint(item: resultLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.resultLabelHeigh),
            NSLayoutConstraint(item: resultLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.resultLabelWidth)])
    }
    
    private func secondLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: textResultLabel, attribute: .top, relatedBy: .equal, toItem: resultLabel, attribute: .bottom, multiplier: 1, constant: ConstraintsOfResultPage.secondLabelTop),
            NSLayoutConstraint(item: textResultLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: ConstraintsOfResultPage.centerX),
            NSLayoutConstraint(item: textResultLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.secondLabelHeigh),
            NSLayoutConstraint(item: textResultLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: ConstraintsOfResultPage.secondLabelWidth)])
    }
    
    func buttonRestartConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: restartButton, attribute: .top, relatedBy: .equal, toItem: textResultLabel, attribute: .bottom, multiplier: 1, constant: 120),
            NSLayoutConstraint(item: restartButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: restartButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 56),
            NSLayoutConstraint(item: restartButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 343)])
    }
    
}

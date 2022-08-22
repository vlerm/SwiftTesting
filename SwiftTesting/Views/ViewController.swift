//
//  ViewController.swift
//  SwiftTesting
//
//  Created by Вадим Лавор on 16.02.22.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy var welcomeLabel = UILabel.welcomeLabel()
    lazy var introductionLabel = UILabel.introductionLabel()
    
    enum FirstPageConstraints {
        static let unionHeighImage: CGFloat = 200
        static let unionWidthImage: CGFloat = 200
        static let unionTopImage: CGFloat = 200
        static let centerX: CGFloat = 0
        static let welcomeHeighButton: CGFloat = 56
        static let welcomeWidthButton: CGFloat = 311
        static let welcomeTopButton: CGFloat = 228
        static let welcomeBottomButton: CGFloat = -50
        static let welcomeHeightLabel: CGFloat = 39
        static let welcomeWidthLabel: CGFloat = 311
        static let welcomeTopLabel: CGFloat = 50
        static let introductionHeightLabel: CGFloat = 66
        static let introductionWidthLabel: CGFloat = 311
        static let introductionTopLabel: CGFloat = 10
    }
    
    private let welcomeImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "itest")
        view.contentMode = .center
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var welcomeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Начать", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 311, height: 56)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(welcomeButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        view.addSubview(welcomeButton)
        view.addSubview(welcomeImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(introductionLabel)
    }
    
    override func viewWillLayoutSubviews() {
        self.imageUnionConstraints()
        self.startButtonConstraints()
        self.firstLabelConstraints()
        self.secondLabelConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func imageUnionConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: welcomeImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: FirstPageConstraints.unionHeighImage),
            NSLayoutConstraint(item: welcomeImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: FirstPageConstraints.unionWidthImage),
            NSLayoutConstraint(item: welcomeImageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: FirstPageConstraints.unionTopImage),
            NSLayoutConstraint(item: welcomeImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: FirstPageConstraints.centerX)])
    }
    
    private func firstLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: welcomeLabel, attribute: .top, relatedBy: .equal, toItem: welcomeImageView, attribute: .bottom, multiplier: 1, constant: FirstPageConstraints.welcomeTopLabel),
            NSLayoutConstraint(item: welcomeLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: FirstPageConstraints.centerX),
            NSLayoutConstraint(item: welcomeLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: FirstPageConstraints.welcomeHeightLabel),
            NSLayoutConstraint(item: welcomeLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: FirstPageConstraints.welcomeWidthLabel)])
    }
    
    private func secondLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: introductionLabel, attribute: .top, relatedBy: .equal, toItem: welcomeLabel, attribute: .bottom, multiplier: 1, constant: FirstPageConstraints.introductionTopLabel),
            NSLayoutConstraint(item: introductionLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: FirstPageConstraints.centerX),
            NSLayoutConstraint(item: introductionLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: FirstPageConstraints.introductionHeightLabel),
            NSLayoutConstraint(item: introductionLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: FirstPageConstraints.introductionWidthLabel)])
    }
    
    private func startButtonConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: welcomeButton, attribute: .top, relatedBy: .equal, toItem: introductionLabel, attribute: .bottom, multiplier: 1, constant: FirstPageConstraints.welcomeTopButton),
            NSLayoutConstraint(item: welcomeButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: FirstPageConstraints.centerX),
            NSLayoutConstraint(item: welcomeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: FirstPageConstraints.welcomeHeighButton),
            NSLayoutConstraint(item: welcomeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: FirstPageConstraints.welcomeWidthButton),
            NSLayoutConstraint(item: welcomeButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: FirstPageConstraints.welcomeBottomButton)])
    }
    
    @objc func welcomeButtonClicked() {
        self.navigationController?.pushViewController(PageViewController(), animated: true)
    }
    
}

extension UILabel {
    
    static func welcomeLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Добро пожаловать!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func introductionLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Здесь ты можешь проверить свой уровень знаний в Swift"
        label.textAlignment = .center
        return label
    }
    
}

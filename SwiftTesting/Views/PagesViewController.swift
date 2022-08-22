//
//  PagesViewController.swift
//  SwiftTesting
//
//  Created by Вадим Лавор on 16.02.22.
//

import UIKit

final class PagesViewController: UIViewController {
    
    private let pageImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel = UILabel.makeTitleLabel()
    lazy var textLabel = UILabel.makeTextLabel()
    
    init(imageWith: PageViewModel) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.black
        pageImageView.image = imageWith.image
        titleLabel.text = imageWith.title
        textLabel.text = imageWith.text
    }
    
    enum Constraints {
        static let pageImageTop: CGFloat = 94
        static let pageImageHeight: CGFloat = 343
        static let pageImageWidth: CGFloat = 343
        static let welcomeTopLabel: CGFloat = 50
        static let introductionTopLabel: CGFloat = 12
        static let centerX: CGFloat = 0
        static let welcomelHeighLabel: CGFloat = 39
        static let welcomeWidthLabel: CGFloat = 311
        static let introductionHeightLabel: CGFloat = 66
        static let introductionWidthLabel: CGFloat = 311
    }
    
    override func viewDidLoad() {
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        view.addSubview(pageImageView)
    }
    
    override func viewWillLayoutSubviews() {
        self.setupPageImageViewConstraints()
        self.setupWelcomeConstraints()
        self.setupIntroductionConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPageImageViewConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: pageImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.pageImageHeight),
            NSLayoutConstraint(item: pageImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.pageImageWidth),
            NSLayoutConstraint(item: pageImageView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: Constraints.pageImageTop),
            NSLayoutConstraint(item: pageImageView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: Constraints.centerX)])
    }
    
    private func setupWelcomeConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: pageImageView, attribute: .bottom, multiplier: 1, constant: Constraints.welcomeTopLabel),
            NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: Constraints.centerX),
            NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.welcomelHeighLabel),
            NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.welcomeWidthLabel)])
    }
    
    private func setupIntroductionConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: textLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: Constraints.introductionTopLabel),
            NSLayoutConstraint(item: textLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: Constraints.centerX),
            NSLayoutConstraint(item: textLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.introductionHeightLabel),
            NSLayoutConstraint(item: textLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: Constraints.introductionWidthLabel)])
    }
}

extension UILabel {
    
    static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }
    
    static func makeTextLabel() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byCharWrapping
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }
    
}

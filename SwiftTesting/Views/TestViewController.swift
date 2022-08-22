//
//  TestViewController.swift
//  SwiftTesting
//
//  Created by Вадим Лавор on 02.05.22.
//

import UIKit

class TestViewController: UIViewController {
    
    weak var collectionView: UICollectionView!
    private var viewModel: TestViewModel?
    var reuseIdentifier = "Cell"
    
    lazy var pageCountlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = q1.count
        label.font = .boldSystemFont(ofSize: 17)
        label.backgroundColor = .red
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        return label
    }()
    
    lazy var questionlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = q1.question
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.halfTextColorChange(fullText: q1.question)
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        return button
    }()
    
    lazy var getResultButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.purple
        button.setTitle("Узнайте результат", for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.isHidden = true
        return button
    }()
    
    override func loadView() {
        super.loadView()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        view.addSubview(pageCountlabel)
        view.addSubview(backButton)
        view.addSubview(getResultButton)
        view.addSubview(questionlabel)
        self.collectionView = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        viewModel = TestViewModel()
        collectionView.backgroundColor = UIColor.black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func viewWillLayoutSubviews() {
        self.setupCollectionViewConstraints()
        self.setupPageCountLabelConstraints()
        self.setupButtonNextConstraints()
        self.setupButtonBackConstraints()
        self.setupQuestionLabelConstraints()
    }
    
    @objc func backButtonClicked() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) { [self] in
            viewModel?.currentQuestionIndex -= 1
            self.questionlabel.halfTextColorChange(fullText: (viewModel?.currentQuestion().question)!)
            self.pageCountlabel.text = viewModel?.currentQuestion().count
            if (viewModel?.currentQuestionIndex)! <= viewModel!.maxQuestionIndex {
                collectionView.reloadData()
            } else {
                collectionView.allowsMultipleSelection = true
                getResultButton.isHidden = false
            }
        }
    }
    
    @objc func nextButtonClicked() {
        self.navigationController?.pushViewController(ResultViewController(), animated: true)
    }
    
    func setupCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -72)])
    }
    
    func setupPageCountLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: pageCountlabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 60),
            NSLayoutConstraint(item: pageCountlabel, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -14),
            NSLayoutConstraint(item: pageCountlabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: pageCountlabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 77)])
    }
    
    func setupButtonBackConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: backButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 60),
            NSLayoutConstraint(item: backButton, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 14),
            NSLayoutConstraint(item: backButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38),
            NSLayoutConstraint(item: backButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 38)])
    }
    
    func setupButtonNextConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: getResultButton, attribute: .top, relatedBy: .equal, toItem: collectionView, attribute: .bottom, multiplier: 1, constant: -72),
            NSLayoutConstraint(item: getResultButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: getResultButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 56),
            NSLayoutConstraint(item: getResultButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 343)])
    }
    
    func setupQuestionLabelConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: questionlabel, attribute: .top, relatedBy: .equal, toItem: pageCountlabel, attribute: .bottom, multiplier: 1, constant: 70),
            NSLayoutConstraint(item: questionlabel, attribute: .bottom, relatedBy: .equal, toItem: collectionView, attribute: .top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: questionlabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: questionlabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 88),
            NSLayoutConstraint(item: questionlabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 360)])
    }
    
}

extension TestViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let question = viewModel?.currentQuestion() else { return 0 }
        return question.answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let question = viewModel?.currentQuestion() else { return UICollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TestCollectionViewCell else { return TestCollectionViewCell()}
        cell.setup(with: question.answers[indexPath.row])
        cell.textLabel.lineBreakMode = .byWordWrapping
        return cell
    }
    
}

extension TestViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let question = viewModel?.currentQuestion() else { return }
        if question.answers[indexPath.row] == question.rightAnswer {
           answers.append(question.answers[indexPath.row])
        }
        viewModel?.nextQuestionIndex()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) { [self] in
            self.questionlabel.text  = viewModel?.currentQuestion().question
            self.questionlabel.halfTextColorChange(fullText: questionlabel.text!)
            self.pageCountlabel.text = viewModel?.currentQuestion().count
            if (viewModel?.currentQuestionIndex)! <= viewModel!.maxQuestionIndex {
                collectionView.reloadData()
            } else {
                getResultButton.isHidden = false
            }
        }
    }
    
}

extension TestViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width - 32, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

extension UILabel {
    
    func halfTextColorChange(fullText: String) {
        let lastWord = fullText.components(separatedBy: " ").last
        let range = NSString(string: fullText).range(of: lastWord!)
        let attribute = NSMutableAttributedString(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.purple , range: range)
        self.attributedText = attribute
    }
    
}

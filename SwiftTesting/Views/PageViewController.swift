//
//  PageViewController.swift
//  SwiftTesting
//
//  Created by Вадим Лавор on 16.02.22.
//

import UIKit

final class PageViewController: UIPageViewController {
    
    enum PageViewControllerConstraints {
        static let centerX: CGFloat = 0
        static let skipHeightButton: CGFloat = 30
        static let skipWidthButton: CGFloat = 100
        static let skipLeftButton: CGFloat = 32
        static let skipBottomButton: CGFloat = -33
        static let nextHeightButton: CGFloat = 56
        static let nextWidthButton: CGFloat = 56
        static let nextRightButton: CGFloat = -32
        static let nextBottomButton: CGFloat = -19
        static let heightPoints: CGFloat = 8
        static let widthPoints: CGFloat = 8
        static let bottomPoint: CGFloat = 74
    }
    
    private var page = [PageViewModel]()
    private var currentIndex = 0
    
    lazy var skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Пропустить", for: .normal)
        button.tintColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(skipButtonClicked), for: .touchUpInside)
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let buttonNext = UIButton(type: .system)
        buttonNext.setBackgroundImage(UIImage(named: "btnNext"), for: .normal)
        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        buttonNext.addTarget(self, action: #selector(nextButtonClicked(_:)), for: .touchUpInside)
        return buttonNext
    }()
    
    lazy var arrayViewController: [UIViewController] = {
        return page.map { PagesViewController(imageWith: $0) }
    }()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll,
                   navigationOrientation: navigationOrientation,
                   options: nil)
        view.backgroundColor = UIColor.black
        dataSource = self
        delegate = self
        setViewControllers([arrayViewController[currentIndex]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        setPageControl()
        page.append(PageViewModel(title: "Проверь свои знания",
                                  text: "Кто ты? Junior, Middle или Senior?",
                                  image: UIImage(named: "book")!))
        page.append(PageViewModel(title: "Сражайся с друзьями",
                                  text: "Узнайте наконец-то, кто кодит лучше!",
                                  image: UIImage(named:"cup")!))
        page.append(PageViewModel(title: "Делись результатами",
                                  text: "Пусть все знают, какой ты умный:)",
                                  image: UIImage(named: "victory")!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillLayoutSubviews() {
        self.setupSkipButtonConstraints()
        self.setupNextButtonConstraints()
    }
    
    private func setPageControl() {
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self])
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = UIColor.purple
    }
    
    private func setupSkipButtonConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: skipButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: PageViewControllerConstraints.skipHeightButton),
            NSLayoutConstraint(item: skipButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: PageViewControllerConstraints.skipWidthButton),
            NSLayoutConstraint(item: skipButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: PageViewControllerConstraints.skipBottomButton),
            NSLayoutConstraint(item: skipButton, attribute: .left, relatedBy: .lessThanOrEqual, toItem: view, attribute: .left, multiplier: 1, constant: PageViewControllerConstraints.skipLeftButton)])
    }
    
    private func setupNextButtonConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nextButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: PageViewControllerConstraints.nextHeightButton),
            NSLayoutConstraint(item: nextButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: PageViewControllerConstraints.nextWidthButton),
            NSLayoutConstraint(item: nextButton, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: PageViewControllerConstraints.nextRightButton),
            NSLayoutConstraint(item: nextButton, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: view, attribute: .bottom, multiplier: 1, constant: PageViewControllerConstraints.nextBottomButton)])
    }
    
    @objc func skipButtonClicked() {
        self.navigationController?.pushViewController(TestViewController(), animated: true)
    }
    
    
    @objc func nextButtonClicked(_ sender: UIButton) {
        currentIndex += 1
        if currentIndex > page.count - 1 {
            self.skipButtonClicked()
            return
        }
        setViewControllers([arrayViewController[currentIndex]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
               let index = arrayViewController.firstIndex(of: currentViewController) {
                currentIndex = index
            }
        }
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PagesViewController else { return nil }
        if let index = arrayViewController.firstIndex(of: viewController), index > 0 {
            return arrayViewController[index - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? PagesViewController else { return nil }
        if let index = arrayViewController.firstIndex(of: viewController), index < page.count - 1 {
            return arrayViewController[index + 1]
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return page.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
}

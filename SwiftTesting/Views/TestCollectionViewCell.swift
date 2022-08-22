//
//  TestCollectionViewCell.swift
//  SwiftTesting
//
//  Created by Вадим Лавор on 02.05.22.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .purple
        contentView.addSubview(textLabel)
        layer.masksToBounds = true
        layer.cornerRadius = 16
        textLabelConstraints()
    }
    
    override var isSelected: Bool {
        didSet {
            self.textLabel.alpha = isSelected ? 0.8 : 1.0
            self.textLabel.layer.borderWidth = isSelected ? 2 : 0
            self.textLabel.layer.borderColor = UIColor.systemPink.cgColor
            self.textLabel.layer.cornerRadius = 15
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with testQuestion: String) {
        textLabel.text = testQuestion
    }
    
    func textLabelConstraints() {
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}

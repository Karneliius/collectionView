//
//  MessagesCollectionViewCell.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 15.02.2023.
//

import UIKit
import SnapKit

class MessagesCollectionViewCell: UICollectionViewCell {
        private lazy var nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 18)
            label.textColor = .label
            label.numberOfLines = 0
            label.textAlignment = .center
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            
            setupViews()
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupHeaders(with text: String) {
            nameLabel.text = text
        }
    }

//MARK: - Setup Views and Constraints methods

private extension MessagesCollectionViewCell {
    func setupViews() {
        contentView.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


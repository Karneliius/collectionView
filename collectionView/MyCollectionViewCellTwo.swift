//
//  MyCollectionViewCellTwo.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 20.01.2023.
//

import UIKit

final class MyCollectionViewCellTwo: UICollectionViewCell {
    private lazy var viewOne: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.addSubview(labelOne)
        labelOne.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return view
    }()
    
    private lazy var labelOne: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .label
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
    
    func changeColor(with color: UIColor) {
        viewOne.backgroundColor = color
    }
}

private extension MyCollectionViewCellTwo {
//MARK: - setup Views and constrains methods
    func setupViews() {
        contentView.addSubview(viewOne)
    }
    
    func setupConstraints() {
        viewOne.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

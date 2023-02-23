//
//  NewsCollectionViewCell.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 15.02.2023.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    private var cellSelected: Bool = false
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        var newsImage = UIImageView()
        newsImage.contentMode = .scaleAspectFit
        newsImage.clipsToBounds = true
        newsImage = UIImageView(frame: CGRectMake(1000, 1000, 1000, 1000))
        return newsImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeText(with text: String) {
        dateLabel.text = text
    }
    func changePhoto(with picture: String) {
        imageView.image = UIImage(named: picture)
    }
    
}
//MARK: - Setup views and constraints

private extension NewsCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(dateLabel)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(2)
            make.leading.trailing.bottom.equalToSuperview()
        
        }
    }
}

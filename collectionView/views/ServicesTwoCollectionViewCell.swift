//
//  ServicesTwoCollectionViewCell.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 16.02.2023.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
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
    func changePhoto(with picture: String) {
        imageView.image = UIImage(named: picture)
    }
    
}

//MARK: - Setup views and constraints

private extension ServicesCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(imageView)
    }
    func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}



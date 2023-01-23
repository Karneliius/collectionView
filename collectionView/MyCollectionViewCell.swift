//
//  MyCollectionViewCell.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 19.01.2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    private lazy var myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "\(Int.random(in: 0..<10))"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    private lazy var myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "trash")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
     
    func setImage(with string: String) {
        myImage.image = UIImage(named: string)
       }
    func setLabel(with string: String) {
        myLabel.text = string
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup views and constraints method
private extension MyCollectionViewCell {
    
    func setupViews(){
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
    }
    
    func setupConstraints(){
        myImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.top.leading.trailing.equalToSuperview()
        }
        myLabel.snp.makeConstraints { make in
            make.top.equalTo(myImage.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
}


//
//  MessagesTableViewCell.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 15.02.2023.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {
    
    private lazy var imageViewCell: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
    //    imageview.layer.cornerRadius = 15
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private lazy var someView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var someLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .systemGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changePhoto(with picture: String) {
        imageViewCell.image = UIImage(named: picture)
    }
    
    func changeHeader(with text: String) {
        headerLabel.text = text
    }
    
    func changeText(with adress: String) {
        someLabel.text = adress
    }
}

//MARK: - Setup Views and Constraints methods

private extension MessagesTableViewCell {
    
    func setupViews() {
        contentView.addSubview(imageViewCell)
        contentView.addSubview(someView)
        someView.addSubview(headerLabel)
        someView.addSubview(someLabel)
    }
    
    func setupConstraints() {
        imageViewCell.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        someView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(imageViewCell.snp.trailing).offset(15)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }
        someLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(0.05)
            make.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
}

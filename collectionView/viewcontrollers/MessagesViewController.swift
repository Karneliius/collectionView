//
//  MessagesViewController.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 15.02.2023.
//

import UIKit
import SnapKit

final class MessagesViewController: UIViewController {
    
    let appsCategoryList = Constants.Category.allCases
    let messageInfo = Constants.Description.allDataCell()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
     
    private lazy var messagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(MessagesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.messagesCollectionViewCell)
        return collectionview
    }()
     
    private let messagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MessagesTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.messagesTableViewCell)
        tableView.isScrollEnabled = false
        return tableView
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        messagesCollectionView.dataSource = self
        messagesCollectionView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.delegate = self

        
        setupViews()
        setupConstraints()
    }

}

//MARK: - CollectionView DataSource methods

extension MessagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int {
        return appsCategoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.messagesCollectionViewCell, for: indexPath) as? MessagesCollectionViewCell  else {return UICollectionViewCell() }
        cell.setupHeaders(with: appsCategoryList[indexPath.item].rawValue)
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        return cell
    }
}

//MARK: - CollectionView Delegate methods

extension MessagesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = appsCategoryList[indexPath.item].rawValue
        label.sizeToFit()
        return CGSize (width: label.frame.size.width + 30, height:collectionView.frame.size.height - 15)
    }
}

//MARK: - TableView DataSource methods

extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messageInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.messagesTableViewCell, for: indexPath) as? MessagesTableViewCell else { return UITableViewCell() }
        cell.changePhoto(with: messageInfo[indexPath.item].imageName)
        cell.changeHeader(with: messageInfo[indexPath.item].name)
        cell.changeText(with: messageInfo[indexPath.item].text)
        return cell
    }
}
//MARK: - TableView Delegate methods

extension MessagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return view.frame.size.height * 0.1
    }
}

//MARK: - Setup Views and Constraints method

private extension MessagesViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(messagesCollectionView)
        contentView.addSubview(messagesTableView)
    }
     
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        messagesCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.07)
        }
        messagesTableView.snp.makeConstraints { make in
            make.top.equalTo(messagesCollectionView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(view).multipliedBy(2)
        }
    }
}

//
//  MainViewController.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 15.02.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    let newsInfo = Constants.newsDescription.allNewsCell()
    let appInfo = Constants.appDescription.allAppsCell()
    
    private lazy var kaspiSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Поиск по Kaspi.kz"
        return searchBar
        }()
    
    private lazy var newsCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
        let height = view.frame.size.height * 0.08
        layout.itemSize = CGSize(width: height * 2, height: height)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.newsCollectionViewCell)
        collectionView.backgroundColor = .clear
            collectionView.showsHorizontalScrollIndicator = false
            return collectionView
    }()
    
    private lazy var serviceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "service")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var magnumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "magnum")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var servicesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ServicesCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.servicesCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var lucenteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "lucente")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        newsCollectionView.dataSource = self
        servicesCollectionView.dataSource = self
        newsCollectionView.delegate = self
        servicesCollectionView.delegate = self
        
    }
}
//MARK: - CollectionView DataSource methods

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newsCollectionView {
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.newsCollectionViewCell, for: indexPath) as! NewsCollectionViewCell
            cell.changePhoto(with: newsInfo[indexPath.item].imageName)
            cell.changeText(with: newsInfo[indexPath.item].date)
            cell.layer.masksToBounds = true
            cell.backgroundColor = .clear
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.servicesCollectionViewCell, for: indexPath) as! ServicesCollectionViewCell
        cell.changePhoto(with: appInfo[indexPath.item].imageName)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newsCollectionView {
            return newsInfo.count
        }
        return appInfo.count
    }
}
//MARK: - Collection view delegate flow methods

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == newsCollectionView{
            let label = UILabel()
            label.text = newsInfo[indexPath.row].date
            label.sizeToFit()
            return CGSize(width: label.frame.size.width + 30, height: collectionView.frame.size.height - 10)
        }
        let height = collectionView.frame.size.height
        return CGSize(width: view.frame.size.width * 0.75, height: height)
        
    }
}

//MARK: - Setup views and constraints

private extension MainViewController {
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(kaspiSearchBar)
        contentView.addSubview(newsCollectionView)
        contentView.addSubview(serviceImageView)
        contentView.addSubview(magnumImageView)
        contentView.addSubview(servicesCollectionView)
        contentView.addSubview(lucenteImageView)
    }
        
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        kaspiSearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.05)
        }
        kaspiSearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        newsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(kaspiSearchBar.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.15)
        }
        serviceImageView.snp.makeConstraints { make in
            make.top.equalTo(newsCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.15)
        }
        magnumImageView.snp.makeConstraints { make in
            make.top.equalTo(serviceImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.10)
        }
        servicesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(magnumImageView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.1)
        }
        lucenteImageView.snp.makeConstraints { make in
            make.top.equalTo(servicesCollectionView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.1)
            make.bottom.equalToSuperview()
        }
    }
}

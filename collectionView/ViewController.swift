//
//  ViewController.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 18.01.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    let colorArray = [UIColor.red, UIColor.green, UIColor.blue]
    let burgers = ["Baconator", "Whooper","Big Mac","Cheeseburger","Quarter Pounder","Hamburger"]
    let burgersImages:[UIImage] = [
    UIImage(named: "baconator")!,
    UIImage(named: "whooper")!,
    UIImage(named: "bigmac")!,
    UIImage(named: "cheeseburger")!,
    UIImage(named: "quarterpounder")!,
    UIImage(named: "hamburger")!,
    ]
    
    private lazy var headerOne: UILabel = {
           let label = UILabel()
           label.textColor = .label
           label.font = UIFont.boldSystemFont(ofSize: 30)
           label.textAlignment = .left
           label.text = "Changing color"
           return label
       }()
    
    private lazy var headerTwo: UILabel = {
           let label = UILabel()
           label.textColor = .label
           label.font = UIFont.boldSystemFont(ofSize: 30)
           label.textAlignment = .left
           label.text = "Burgers"
           return label
       }()
    
    private lazy var someLabelAtBottom: UILabel = {
            let label = UILabel()
            label.textColor = .label
            label.font = UIFont.systemFont(ofSize: 50)
            label.textAlignment = .center
            label.text = "Some label"
            return label
        }()
    
    private lazy var myBurgersCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let height = view.frame.size.height * 0.05 
        layout.itemSize = CGSize(width: height * 2, height: height)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCollectionViewCell")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    private lazy var mySecondCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let height = view.frame.size.height * 0.05
        layout.itemSize = CGSize(width: height * 2, height: height)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyCollectionViewCellTwo.self, forCellWithReuseIdentifier: "myCollectionViewCellTwo")
        collectionView.backgroundColor = .clear
        return collectionView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        myBurgersCollection.dataSource = self
        myBurgersCollection.delegate = self
        
        mySecondCollectionView.dataSource = self
        mySecondCollectionView.delegate = self
        
        setupViews()
        setupConstraints()
    }


}
//MARK: - Delegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case mySecondCollectionView:
            return CGSize(width: 150, height: mySecondCollectionView.frame.size.height - 20)
        case myBurgersCollection:
            return CGSize(width: myBurgersCollection.frame.size.width - 20, height: myBurgersCollection.frame.size.height - 20)
        default:
            return CGSize(width: 150, height: 20)
        }
    }
//MARK: - changing color
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mySecondCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCellTwo
            cell.changeColor(with: colorArray[indexPath.item])
        }
    }
}
//MARK: - Collection view data source methods

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return burgers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == myBurgersCollection{
            guard let cell = myBurgersCollection.dequeueReusableCell(withReuseIdentifier: "ID", for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 10
            cell.setLabel(with:"\(burgers[indexPath.item])")
            cell.setImage(with: "\(burgersImages[indexPath.row])")
            return cell
        }
        else if collectionView == mySecondCollectionView{
            guard let cell = mySecondCollectionView.dequeueReusableCell(withReuseIdentifier: "ID", for: indexPath) as? MyCollectionViewCellTwo else { return UICollectionViewCell() }
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 10
            return cell
        }
        else { return UICollectionViewCell() }
    }
}

//MARK: - Setup views and constraints methods
private extension ViewController{
    
    func setupViews(){
        view.addSubview(headerOne)
        view.addSubview(myBurgersCollection)
        view.addSubview(headerTwo)
        view.addSubview(mySecondCollectionView)
        view.addSubview(someLabelAtBottom)
    }
    
    func setupConstraints(){
        headerOne.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-5)
            make.trailing.leading.equalToSuperview()
        }
        myBurgersCollection.snp.makeConstraints { make in
            make.top.equalTo(headerOne.snp.bottom)
            make.trailing.leading.equalToSuperview().offset(-5)
            make.height.equalToSuperview().dividedBy(5)
        }
        headerTwo.snp.makeConstraints { make in
            make.top.equalTo(myBurgersCollection.snp.bottom)
            make.trailing.leading.equalToSuperview().offset(5)
        }
        mySecondCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerTwo.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().offset(5)
            make.height.equalToSuperview().dividedBy(3)
        }
        someLabelAtBottom.snp.makeConstraints { make in
            make.top.equalTo(mySecondCollectionView.snp.bottom).inset(-15)
            make.trailing.leading.equalToSuperview()
        }
    }
}



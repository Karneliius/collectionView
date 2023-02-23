//
//  ViewController.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 15.02.2023.
//

import UIKit
import SnapKit

final class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: MainViewController())
        let vc2 = UINavigationController(rootViewController: KaspiQRViewController())
        let vc3 = UINavigationController(rootViewController: MessagesViewController())
        let vc4 = UINavigationController(rootViewController: ServicesViewController())
        
        view.backgroundColor = .systemBackground
        
        vc1.tabBarItem.image = UIImage(systemName: "homekit")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "homekit.fill")
        vc2.tabBarItem.image = UIImage(systemName: "qrcode.viewfinder")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "qrcode.viewfinder.fill")
        vc3.tabBarItem.image = UIImage(systemName: "ellipsis.message")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "ellipsis.message.fill")
        vc4.tabBarItem.image = UIImage(systemName: "list.dash.header.rectangle")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "list.dash.header.rectangle.fill")
        
        vc1.title = "Main"
        vc2.title = "Kaspi QR"
        vc3.title = "Messages"
        vc4.title = "Services"
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }
}




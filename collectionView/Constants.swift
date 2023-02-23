//
//  Constants.swift
//  collectionView
//
//  Created by Anelya Kabyltayeva on 15.02.2023.
//

import Foundation

struct Constants {
    
    struct Identifiers {
        static let newsCollectionViewCell = "NewsCollectionViewCell"
        static let messagesCollectionViewCell = "MessagesCollectionViewCell"
        static let messagesTableViewCell = "MessagesTableViewCell"
        static let servicesCollectionViewCell = "ServicesCollectionViewCell"
    }
    enum Category: String, CaseIterable {
            case kaspiGold = "Kaspi Gold"
            case kaspiBonus = "Kaspi Бонус"
            case kaspiDeposit = "Kaspi Депозит"
            case kaspiShares = "Акции"
            case kaspiRed = "Kaspi Red"
            case kaspiTravel = "Kaspi Pay"
        }
    struct Info {
            let name: String
            let text: String
            let imageName: String
        }

    struct Description {
            static func allDataCell() -> [Info] {
                [
                    .init(name: "Kaspi Gold", text: "Покупка: 500 тг Beeline", imageName: "gold"),
                    .init(name: "Kaspi Бонус",text: "Начислено:9,05 Б", imageName: "bonus"),
                    .init(name: "Kaspi Депозит",text: "Kaspi Депозит D-002 Пополнение", imageName: "deposit"),
                    .init(name: "Акции",text: "5% Бонусов! Беговые дорожки, велотренажеры, силовые тринажеры", imageName: "shares"),
                    .init(name: "Платежи",text: "Выставлена квитанция Алсеко", imageName: "pay"),
                    .init(name: "Магазин на Kaspi.kz",text: "Эти товары могут Вас заинтересовать", imageName: "shop"),
                    .init(name: "Kaspi Travel",text: "Покупайте авиабилеты на вессение праздники",imageName: "travel"),
                    .init(name: "Kaspi Red",text: "Откройте Kaspi Red и совершайте любые покупки", imageName: "red"),
                    .init(name: "Объявления",text: "Бухгалтерия, юристы, переводчики и другие специалисты", imageName: "ad")
                ]
            }
        }
    struct newsInfo {
        let date: String
        let imageName: String
    }
    
    struct newsDescription {
        static func allNewsCell() -> [newsInfo] {
            [.init(date: "20 февраля - 26 февраля", imageName: "fourth"),
             .init(date: "Оформить онлайн", imageName: "third"),
             .init(date: "Открыть Kaspi Red онлайн", imageName: "second"),
             .init(date: "20 февраля - 26 февраля", imageName: "first"),
             .init(date: "20 февраля - 26 февраля", imageName: "fifth"),
             .init(date: "20 февраля - 26 февраля", imageName: "six"),
             .init(date: "20 февраля - 26 февраля", imageName: "seven"),
             .init(date: "20 февраля - 26 февраля", imageName: "eight")
            ]
        }
    }
    struct appInfo {
        let imageName: String
    }
    struct appDescription {
        static func allAppsCell() -> [appInfo] {
            [.init(imageName: "7"),
             .init(imageName: "5"),
             .init(imageName: "3"),
             .init(imageName: "1"),
             .init(imageName: "6"),
             .init(imageName: "4"),
             .init(imageName: "2"),
            ]
        }
    }
    
}

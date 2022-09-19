//
//  MainTabController.swift
//  challange
//
//  Created by Rayssa Ribeiro on 12/09/22.
//

import UIKit

class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        uiTabBarSetting()
        
    }

    func configureViewControllers(){
        let timeline = TimelineController(collectionViewLayout: UICollectionViewFlowLayout())
        timeline.tabBarItem.image = UIImage(named: "home_unselected")
        
        let nav1 = templateNavigationController(image: UIImage(named: "iconTimeline")!, rootViewController: timeline)
        
        let info = InfoController()
        info.tabBarItem.image = UIImage(named: "search_unselected")
        let nav2 = templateNavigationController(image: UIImage(named: "iconInfo")!, rootViewController: info)
        
      viewControllers = [nav1, nav2]
   
    }
    
    func templateNavigationController(image: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController (rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
    
    
    //tabBar deixou de aparecer, funcao pra correcao
    func uiTabBarSetting() {
        if #available(iOS 15.0, *){
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
}

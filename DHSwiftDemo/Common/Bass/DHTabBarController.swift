//
//  DHTabBarController.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/7/20.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import UIKit

class DHTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBar.isTranslucent = false
        setupViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupViewController() -> Void {
        setChildViewController(viewContrller: DHHomeViewController(), title: "首页", image: "tabBar_image_me", selectImage: "tabBar_image_me")
        setChildViewController(viewContrller: DHSetViewController(), title: "我的", image: "tabBar_image_me", selectImage: "tabBar_image_me")
    }
    
    private func setChildViewController(viewContrller: UIViewController, title: String, image: String, selectImage: String) {
        
//        viewContrller.tabBarItem.title = title
        viewContrller.tabBarItem.image = UIImage(named: image)
        viewContrller.tabBarItem.selectedImage = UIImage(named: selectImage)
//        viewContrller.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3)
        let nav = DHNavigationController.init(rootViewController: viewContrller)
        self.addChildViewController(nav)
        
    }

}

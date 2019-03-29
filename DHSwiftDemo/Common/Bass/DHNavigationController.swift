//
//  DHNavigationController.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/7/20.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import UIKit

class DHNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.isTranslucent = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return topViewController?.prefersStatusBarHidden ?? false
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

}

extension UINavigationController {
    
    public func setBackgroundColor(color: UIColor = UIColor.clear) {
        navigationBar.setBackgroundImage(UIImage.imageByColor(color: color), for: .default)
    }
    
    public func setShadowColor(color: UIColor = UIColor.white) {
        navigationBar.shadowImage = UIImage.imageByColor(color: color)
    }
    
    public func setTitleAttributes(attributes: [NSAttributedString.Key : Any] = [NSAttributedStringKey.foregroundColor : UIColor.black , NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17)]) {
        navigationBar.titleTextAttributes = attributes
    }
    
    public func setTitleStyle(color: UIColor = UIColor.black, fontSize: CGFloat = 17) {
        var attributes = [NSAttributedStringKey : Any]()
        attributes[NSAttributedStringKey.foregroundColor] = color
        attributes[NSAttributedStringKey.font] = UIFont.systemFont(ofSize: fontSize)
        setTitleAttributes(attributes: attributes)
    }
    
}

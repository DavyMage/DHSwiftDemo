//
//  DHBaseViewController.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/7/20.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import UIKit

class DHBaseViewController: UIViewController {

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        view.borderWidth = 1.0
        view.borderColor = UIColor.randomColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return statusBarHidden
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    MARK: - private methods
    
    /// 默认配置
    private func defaultConfiguration() -> Void {
        
    }
    
    //    MARK: - public methods
    
    var statusBarHidden: Bool = false
    
    
    /// 设置导航背景颜色
    ///
    /// - Parameter color: 背景颜色，default UIColor.clear
    func setNavBarBackgroundColor(color: UIColor = UIColor.clear) {
        navigationController?.setBackgroundColor(color: color)
    }
    
    /// 设置导航阴影颜色
    ///
    /// - Parameter color: 阴影颜色，default UIColor.clear
    func setNavBarShadowColor(color: UIColor = UIColor.clear) {
        navigationController?.setShadowColor(color: color)
    }
    
    /// 设置导航透明
    ///
    /// - Parameter translucent: default false
    func setNavBarTranslucent(translucent: Bool = false) {
        navigationController?.navigationBar.isTranslucent = translucent
    }
    
    /// 这是导航隐藏
    ///
    /// - Parameters:
    ///   - hidden: 默认不隐藏
    ///   - animated: 默认有动画
    func setNavigationBarHidden(hidden: Bool = false, animated: Bool = true) {
        navigationController?.setNavigationBarHidden(hidden, animated: true)
    }
    
    

}

extension DHBaseViewController {
    
    struct Keys {
        static var leftTitleKey : String = "leftTitleKey"
    }
    
    open var leftTitle: String {
        get{
            return objc_getAssociatedObject(self, &Keys.leftTitleKey) as! String
        }
        set{
            objc_setAssociatedObject(self, &Keys.leftTitleKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
}

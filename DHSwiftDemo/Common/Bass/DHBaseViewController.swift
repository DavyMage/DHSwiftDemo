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
        return self.statusBarHidden
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
        self.navigationController?.setBackgroundColor(color: color)
    }
    
    func setNavBarShadowColor(color: UIColor = UIColor.clear) {
        self.navigationController?.setShadowColor(color: color)
    }
    
    func setNavBarTranslucent(translucent: Bool = false) {
        self.navigationController?.navigationBar.isTranslucent = translucent
    }
    
    func setNavigationBarHidden(hidden: Bool = false, animated: Bool = true) {
        self.navigationController?.setNavigationBarHidden(hidden, animated: true)
    }
    
    

}

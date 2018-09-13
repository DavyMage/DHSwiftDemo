//
//  DHHomeViewController.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/7/20.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import UIKit

class DHHomeViewController: DHBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDefault()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupDefault() {
        self.view.backgroundColor = UIColor.randomColor
        print("-------------------- \(view.height)",view.width)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "YYYY - MM - dd HH:mm:ss zzz EEEE MMMM"
        print("-------------------- ",dateformatter.string(from: Date()))
        let dateComponents = Calendar.current.dateComponents([.year,.month, .day, .hour,.minute,.second], from: Date())
        print("--------------------",dateComponents)
        let timestamp = Date.timestamp
        let milliStamp = Date.milliStamp
        print("--------------------",timestamp,milliStamp,Date().weekday)
        
    }

}

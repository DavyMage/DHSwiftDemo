//
//  DHSetViewController.swift
//  DHSwiftDemo
//
//  Created by daixinhui on 2018/7/20.
//  Copyright © 2018年 代新辉. All rights reserved.
//

import UIKit
import SnapKit

class DHSetViewController: DHBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    let tableView:UITableView = UITableView.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tableView);
//        tableView.backgroundColor = UIColor.red
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //    MARK: - UITableViewDelegate,UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.randomColor
//        cell.textLabel?.textColor = UIColor.randomColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\((#file as NSString).lastPathComponent)-------------\(#function)---------\(#line)--------\(indexPath.row)")
        let homeViecontroller = DHHomeViewController.init()
        self.navigationController?.pushViewController(homeViecontroller, animated: true)
    }
    
}

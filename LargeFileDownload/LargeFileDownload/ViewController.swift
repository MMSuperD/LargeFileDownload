//
//  ViewController.swift
//  LargeFileDownload
//
//  Created by sh-lx on 2019/3/21.
//  Copyright © 2019年 WangDan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createPage()
        AdaptiveIOS11()
        
    }
    
    func createPage() {
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.red
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 80;
        tableView.register(UINib.init(nibName: "ShowCell", bundle: Bundle.main), forCellReuseIdentifier: "ShowCell")
        tableView.tableFooterView = UIView()
        
        //这个属性很重要,导航控制布局什么地方开始
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    func AdaptiveIOS11() {
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    //MARK 属性
    lazy var tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
}

extension UIViewController:UITableViewDelegate,UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath)
        return cell
    }
    
    
    
}




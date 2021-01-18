//
//  ListViewController.swift
//  SwiftUITest
//
//  Created by 小冬 on 2021/1/18.
//  Copyright © 2021 小冬. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var listArray: NSMutableArray?;
    var listTableView: UITableView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "list";
        
        self.view.backgroundColor = UIColor.white;
        
        loadData();
        
        createListTableView();
    }
    
    
    func loadData() -> Void {
        listArray = ["one","two","three","four","five","six"]
    }
    
    func createListTableView() -> Void {
        listTableView = UITableView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 100), style: UITableView.Style.plain);
        listTableView.delegate = self;
        listTableView.dataSource = self;
        listTableView .register(ListTableViewCell.classForCoder(), forCellReuseIdentifier: "ListTableViewCell");
        self.view.addSubview(listTableView);
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  listCell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell;
        
        let string = listArray?[indexPath.row];
        listCell.nameLabel?.text = string as? String;
        return listCell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let string: NSString = listArray![indexPath.row] as! NSString;
        NSLog("点击：%@", string);
    }
}

//
//  ViewController.swift
//  SwiftUITest
//
//  Created by 小冬 on 2021/1/18.
//  Copyright © 2021 小冬. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页";
        self.view.backgroundColor = .white;
        
        let baseView = UIView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: 40));
        baseView.backgroundColor = UIColor.lightGray;
        self.view.addSubview(baseView);
        
        // 测试姓名
        let nameLabel = UILabel(frame:CGRect(x: 20, y: 0, width: 60, height: 40));
        nameLabel.numberOfLines = 1;
        nameLabel.textColor = UIColor.blue;
        nameLabel.text = "姓名：";
        baseView.addSubview(nameLabel);
        
        let nameTextField = UITextField(frame: CGRect(x: nameLabel.frame.maxX + 10, y: nameLabel.frame.minY, width: 200, height: 40));
        nameTextField.placeholder = "请输入名字";
        baseView.addSubview(nameTextField);
        
//        let submitButton = UIButton(type: UIButton.ButtonType.custom);
        let submitButton = UIButton(type: .custom);
        submitButton.frame = CGRect(x: 50, y: baseView.frame.maxY + 100, width: UIScreen.main.bounds.size.width - 2*50, height: 60);
        submitButton.backgroundColor = UIColor.yellow;
        submitButton.setTitle("提交", for: .normal);
        submitButton.setTitleColor(.black, for: UIControl.State.normal);
        self.view.addSubview(submitButton);
        
        submitButton.addTarget(self, action: #selector(buttonClick(button:)), for: UIControl.Event.touchUpInside);
        
        // 第三方配置
        let threeButton = UIButton(type: UIButton.ButtonType.custom);
        threeButton.backgroundColor = UIColor.red;
        threeButton.setTitle("第三方", for: UIControl.State.normal);
        threeButton.setTitleColor(UIColor.black, for: UIControl.State.normal);
        self.view.addSubview(threeButton);
        threeButton.snp.remakeConstraints { (make) in
             make.top.equalToSuperview().offset(400)
             make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(60)
        }
        threeButton.addTarget(self, action: #selector(threeButtonClick(btn:)), for: UIControl.Event.touchUpInside);
    }

    // 导航push
    @objc  func buttonClick(button: UIButton){
        let listVC = ListViewController();
        self.navigationController?.pushViewController(listVC, animated: true);
    }

    @objc func threeButtonClick(btn: UIButton){
        self.navigationController?.pushViewController(NextViewController(), animated: true);
        
    }
}


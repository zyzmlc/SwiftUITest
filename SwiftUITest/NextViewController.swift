//
//  NextViewController.swift
//  SwiftUITest
//
//  Created by 小冬 on 2021/1/18.
//  Copyright © 2021 小冬. All rights reserved.
//

import UIKit
import Kingfisher
import HandyJSON

class NextViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "next";
        self.view.backgroundColor = .white;
        // Do any additional setup after loading the view.
        
        
        let headIV = UIImageView();
        headIV.backgroundColor = UIColor.red;
        self.view.addSubview(headIV);
        headIV.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(50)
            make.height.equalTo(200)
            make.width.equalTo(200)
        };
        let url = URL(string: "http://mvimg2.meitudata.com/55fe3d94efbc12843.jpg")

//        headIV.kf.setImage(with: url)
        headIV.kf.setImage(with: url, placeholder: UIImage(named: "icon_head"), options: nil, progressBlock: nil, completionHandler: nil);
        
        // json转model
        let jsonString = "{\"name\":\"cat\",\"id\":\"12345\",\"num\":180}";
        let animail = JSONDeserializer<Animal>.deserializeFrom(json: jsonString);
        NSLog("name:\(String(describing: animail?.name)), id:\(String(describing: animail?.id)), num:\(String(describing: animail?.num))")
        
        let jsonString1 = "{\"num\":12345,\"comp1\":{\"aInt\":1,\"aString\":\"aaaaa\"},\"comp2\":{\"aInt\":2,\"aString\":\"bbbbb\"}}"
        if let composition = JSONDeserializer<Composition>.deserializeFrom(json: jsonString1) {
            print(composition);
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


class Animal: HandyJSON {
    var name: String?
    var id: String?
    var num: Int?
    required init() {}
}


class Component: HandyJSON {
    var aInt: Int?
    var aString: String?
    required init() {}
}
class Composition: HandyJSON {
    var num: Int?
    var comp1: Component?
    var comp2: Component?
    required init() {}
}


//
//  ListTableViewCell.swift
//  SwiftUITest
//
//  Created by 小冬 on 2021/1/18.
//  Copyright © 2021 小冬. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    var nameLabel     : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        nameLabel = UILabel.init(frame: CGRect(x: 60, y: 0, width:UIScreen.main.bounds.size.width , height:60.0))
        nameLabel?.textColor = UIColor.darkText
        nameLabel?.font = UIFont.systemFont(ofSize: 18)
        nameLabel?.text = "世界杯开幕";
        self.contentView.addSubview(nameLabel!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

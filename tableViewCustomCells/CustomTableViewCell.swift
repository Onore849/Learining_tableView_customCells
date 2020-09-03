//
//  CustomTableViewCell.swift
//  tableViewCustomCells
//
//  Created by 野澤拓己 on 2020/09/03.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private let _switch: UISwitch = {
       
        let _switch = UISwitch()
        _switch.onTintColor = .blue
        _switch.isOn = true
        
        return _switch
    }()
    
    private let myImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bike1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
       
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "Custom Cell"
        
        return label
    }()
    
    private let switchBtn: UISwitch = {
       
        let _switch = UISwitch()
        _switch.onTintColor = .blue
        _switch.isOn = true
        
        return _switch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .orange
        
        contentView.addSubview(switchBtn)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, imageName: String) {
        
        myLabel.text = text
        myImageView.image = UIImage(named: imageName)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImageView.image = nil
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageViewWidth = contentView.frame.size.height - 10
        
        let switchSize = switchBtn.sizeThatFits(contentView.frame.size)
        
        switchBtn.frame = CGRect(x: 5, y: (contentView.frame.size.height - switchSize.height)/2, width: switchSize.width, height: switchSize.height)
        
        myLabel.frame = CGRect(
            x: 10+switchBtn.frame.size.width,
            y: 0,
            width: contentView.frame.width - 10 - switchBtn.frame.size.width - imageViewWidth,
            height: contentView.frame.size.height
        )
        
        myImageView.frame = CGRect(x: contentView.frame.size.width - imageViewWidth, y: 3, width: imageViewWidth, height: imageViewWidth)
        

    }
    
}

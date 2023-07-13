//
//  BasicInformationTableViewCell.swift
//  SnapkitTest
//
//  Created by Alex on 01.08.2022.
//

import UIKit

class BasicInformationTableViewCell: UITableViewCell {
    
    let indentifire = "BasicInformationCell"
    
    var firstLeftLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.549646616, green: 0.5525885224, blue: 0.5491517782, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    var firstRightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    
    var secondLeftLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.549646616, green: 0.5525885224, blue: 0.5491517782, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    var secondRightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    var thirdLeftLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.549646616, green: 0.5525885224, blue: 0.5491517782, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    var thirdRightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: indentifire)
        inital()
    }
    
    private func inital() {
        contentView.addSubview(firstLeftLabel)
        contentView.addSubview(firstRightLabel)
        
        contentView.addSubview(secondLeftLabel)
        contentView.addSubview(secondRightLabel)
        
        contentView.addSubview(thirdLeftLabel)
        contentView.addSubview(thirdRightLabel)
        
        firstLeftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(130)
            make.height.equalTo(30)
        }
        
        firstRightLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(0)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
        
        secondLeftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(130)
            make.height.equalTo(30)
        }
        
        secondRightLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(40)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
        
        thirdLeftLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(80)
            make.right.equalToSuperview().inset(130)
            make.height.equalTo(30)
        }
        
        thirdRightLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(80)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

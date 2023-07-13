//
//  InformationTableViewCell.swift
//  SnapkitTest
//
//  Created by Alex on 15.08.2022.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    
    var mainView = UIView()
    
    var rocketLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var dateLabel: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.3327009678, green: 0.3295881152, blue: 0.3294977546, alpha: 1)
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    var img: UIImageView = {
        var imag = UIImageView()
        
        return imag
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initial()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initial() {
        
        contentView.addSubview(mainView)
        
        mainView.addSubview(rocketLabel)
        mainView.addSubview(dateLabel)
        mainView.addSubview(img)
        
        mainView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview().inset(0)
        }
        
        rocketLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(100)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(60)
            make.right.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(25)
        }
        
        img.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(40)
            make.width.equalTo(40)
            make.right.equalToSuperview().inset(20)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

    }

}

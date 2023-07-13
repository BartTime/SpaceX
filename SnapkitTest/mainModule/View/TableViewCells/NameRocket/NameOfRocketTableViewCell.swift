//
//  NameOfRocketTableViewCell.swift
//  SnapkitTest
//
//  Created by Alex on 31.07.2022.
//

import UIKit

class NameOfRocketTableViewCell: UITableViewCell {
    
    let identifier = "CellOfRocket"
    
    var labelOfNameRocket: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    var image: UIImageView = {
        var imag = UIImageView()

        return imag
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: identifier)
        contentView.addSubview(labelOfNameRocket)
        contentView.addSubview(image)
       
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(25)
            make.width.equalTo(30)
        }
        labelOfNameRocket.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(0)
            make.right.equalToSuperview().inset(70)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

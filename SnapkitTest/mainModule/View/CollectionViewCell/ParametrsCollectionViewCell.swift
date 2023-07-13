//
//  ParametrsCollectionViewCell.swift
//  SnapkitTest
//
//  Created by Alex on 01.08.2022.
//

import UIKit

class ParametrsCollectionViewCell: UICollectionViewCell {
    
    var firstLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    var secondLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        firstLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(5)
            make.top.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func configureSomeCell() {
        firstLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(5)
            make.top.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
    
    func setupCell(firstLabel: String, secondLabel: String) {
        self.firstLabel.text = firstLabel
        self.secondLabel.text = secondLabel
        self.firstLabel.textColor = .white
        self.secondLabel.textColor = .gray
    }
}

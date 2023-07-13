//
//  ParametrsOfRocketTableViewCell.swift
//  SnapkitTest
//
//  Created by Alex on 01.08.2022.
//

import UIKit

class ParametrsOfRocketTableViewCell: UITableViewCell {
    var info: InfoForRocket?
    
    let cellId = "cellId"
    let identifire = "ParametrsOfRocket"
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: identifire)
        
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .black
        collectionView.register(ParametrsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(15)
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

extension ParametrsOfRocketTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ParametrsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = #colorLiteral(red: 0.1058690324, green: 0.1058908626, blue: 0.105864279, alpha: 1)
        cell.layer.cornerRadius = 35
        
        var height: String
        var diametr: String
        var mass: String
        var weight: String
        
        if info?.height.feet != nil {
            height = "\(info!.height.feet!)"
        }else {
            height = "Неизвестно"
        }
        
        if info?.diameter.feet != nil {
            diametr = "\(info!.diameter.feet!)"
        }else {
            diametr = "Неизвестно"
        }
        
        if info?.mass.lb != nil {
            mass = "\(info!.mass.lb)"
        }else {
            mass = "Неизвестно"
        }
        
        if info?.payload_weights[0].lb != nil {
            weight = "\(info!.payload_weights[0].lb)"
        }else{
            weight = "Неизвестно"
        }
        
        
        if indexPath.item == 0 {
            cell.setupCell(firstLabel: height, secondLabel: "Высота, ft")
        }else if indexPath.item == 1 {
            cell.setupCell(firstLabel: diametr, secondLabel: "Диаметр, ft")
        }else if indexPath.item == 2 {
            cell.setupCell(firstLabel: mass, secondLabel: "Масса, lb")
        }else {
            cell.setupCell(firstLabel: weight, secondLabel: "Нагрузка, lb")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

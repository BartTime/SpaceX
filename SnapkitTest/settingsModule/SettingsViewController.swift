//
//  SettingsViewController.swift
//  SnapkitTest
//
//  Created by Alex on 15.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private var firstSegment   = UISegmentedControl(items: ["m", "ft"])
    private var secondSegment  = UISegmentedControl(items: ["m", "ft"])
    private var thirdSegment   = UISegmentedControl(items: ["kg", "lb"])
    private var fourthSegment  = UISegmentedControl(items: ["kg", "lb"])
    
    private var firstLabel   = UILabel()
    private var secondLabel  = UILabel()
    private var thirdLabel   = UILabel()
    private var fourthLabel  = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initial()
    }
    
    private func initial() {
        view.backgroundColor = .black
        
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        view.addSubview(fourthLabel)
        
        view.addSubview(firstSegment)
        view.addSubview(secondSegment)
        view.addSubview(thirdSegment)
        view.addSubview(fourthSegment)
        
        
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(150)
            make.height.equalTo(40)
        }
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(110)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(150)
            make.height.equalTo(40)
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(180)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(150)
            make.height.equalTo(40)
        }
        
        fourthLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(150)
            make.height.equalTo(40)
        }
        
        firstSegment.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.width.equalTo(130)
        }
        
        secondSegment.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(110)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.width.equalTo(130)
        }
        
        thirdSegment.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(180)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.width.equalTo(130)
        }
        
        fourthSegment.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
            make.width.equalTo(130)
        }
        
        firstLabel.text        = "Высота"
        secondLabel.text       = "Диаметр"
        thirdLabel.text        = "Масса"
        fourthLabel.text       = "Полезная нагрузка"
        
        firstLabel.textColor   = .white
        secondLabel.textColor  = .white
        thirdLabel.textColor   = .white
        fourthLabel.textColor  = .white
        
        firstSegment.tintColor = .red
        secondSegment.tintColor = .red
        thirdSegment.tintColor = .red
        fourthLabel.tintColor = .red
        
        firstSegment.backgroundColor   = #colorLiteral(red: 0.07842033356, green: 0.07843843848, blue: 0.07841635495, alpha: 1)
        secondSegment.backgroundColor  = #colorLiteral(red: 0.07842033356, green: 0.07843843848, blue: 0.07841635495, alpha: 1)
        thirdSegment.backgroundColor   = #colorLiteral(red: 0.07842033356, green: 0.07843843848, blue: 0.07841635495, alpha: 1)
        fourthSegment.backgroundColor  = #colorLiteral(red: 0.07842033356, green: 0.07843843848, blue: 0.07841635495, alpha: 1)
        
        
        firstSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        secondSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        thirdSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        fourthSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        firstSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        secondSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        thirdSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        fourthSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
    }
    
}

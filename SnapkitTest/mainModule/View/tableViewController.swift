//
//  tableViewController.swift
//  SnapkitTest
//
//  Created by Alex on 31.07.2022.
//

import UIKit
import SnapKit

class tableViewController: UIViewController {
    var information: InfoForRocket?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        return tableView
    }()
    
    let imageOfRocket = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initial()
        
    }
    
    private func initial() {
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        view.addSubview(imageOfRocket)
        
        imageOfRocket.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(0)
            make.height.equalTo(270)
        }
        
        tableView.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(0)
            make.bottom.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(270)
        }
        
        self.tableView.register(ParametrsOfRocketTableViewCell.self, forCellReuseIdentifier: "ParametrsOfRocket")
        self.tableView.register(NameOfRocketTableViewCell.self, forCellReuseIdentifier: "CellOfRocket")
        self.tableView.register(BasicInformationTableViewCell.self, forCellReuseIdentifier: "BasicInformationCell")
        
        
        let someUrl = (information?.flickr_images[0])!
        guard let url = URL(string: someUrl) else { return }
        
        URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let self = self else { return }
            
            guard error == nil else { return }
            
            guard let data = data else {
                self.imageOfRocket.image = UIImage(named: "falconHeavy")
                return
            }
            DispatchQueue.main.async {
                self.imageOfRocket.image = UIImage(data: data)
                
            }
        }.resume()
    }

}
extension tableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 120
        }else if indexPath.section == 0 {
            return 45
        }else {
            return 120
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
        {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
            let label = UILabel()
            headerView.addSubview(label)
            label.snp.makeConstraints { make in
                make.left.right.equalToSuperview().inset(25)
                make.top.bottom.equalToSuperview().inset(5)
            }
            
            if (section != 0 ) {
                headerView.backgroundColor  = UIColor.black
                label.textColor             = .white
                label.font                  = UIFont.boldSystemFont(ofSize: 20)
            }else{
                headerView.frame          = CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 0)
            }
            
            switch section {
            case 3: label.text = "Первая ступень"
            case 4: label.text = "Вторая ступень"
            default: label.text = ""
            }
            
            return headerView
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellOfRocket", for: indexPath) as? NameOfRocketTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .black
            cell.labelOfNameRocket.text = information?.name
            cell.labelOfNameRocket.textColor = .white
            cell.image.image = UIImage(systemName: "gearshape")
            
            cell.image.tintColor = .white
            
            return cell
        }else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ParametrsOfRocket", for: indexPath) as? ParametrsOfRocketTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .black
            cell.info = information
            return cell
        }else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicInformationCell", for: indexPath) as? BasicInformationTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .black
            cell.firstLeftLabel.text = "Первый запуск"
            cell.firstRightLabel.text = information?.first_flight
           
            
            cell.secondRightLabel.text = "США"
            cell.secondLeftLabel.text = "Страна"
            
            var cost: String
            if information?.cost_per_launch != nil {
                cost = "\(information!.cost_per_launch)"
            }else {
                cost = "Неизвестно"
            }
            
            cell.thirdRightLabel.text = "$\(cost)"
            cell.thirdLeftLabel.text = "Стоимость запуска"
            
            return cell
        } else if indexPath.section == 3{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicInformationCell", for: indexPath) as? BasicInformationTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .black
            
            var engeines: String
            var tons: String
            var time: String
            
            if information?.first_stage.engines != nil {
                engeines = "\(information!.first_stage.engines)"
            }else{
                engeines = "Неизвестно"
            }
            
            if information?.first_stage.fuel_amount_tons != nil {
                tons = "\(information!.first_stage.fuel_amount_tons) т"
            }else {
                tons = "Неизвестно"
            }
            
            if information?.first_stage.burn_time_sec != nil {
                time = "\(information!.first_stage.burn_time_sec!) ч"
            }else {
                time = "Неизвестно"
            }
            
            
            
            cell.firstLeftLabel.text = "Кол-во двигателей"
            cell.firstRightLabel.text = "\(engeines)"
            
            cell.secondLeftLabel.text = "Кол-во топлива"
            cell.secondRightLabel.text = "\(tons)"
            
            cell.thirdLeftLabel.text = "Время сгорания"
            cell.thirdRightLabel.text = "\(time)"
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicInformationCell", for: indexPath) as? BasicInformationTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .black
            
            var engeines: String
            var tons: String
            var time: String
            
            if information?.second_stage.engines != nil {
                engeines = "\(information!.second_stage.engines)"
            }else{
                engeines = "Неизвестно"
            }
            
            if information?.second_stage.fuel_amount_tons != nil {
                tons = "\(information!.second_stage.fuel_amount_tons) т"
            }else {
                tons = "Неизвестно"
            }
            
            if information?.second_stage.burn_time_sec != nil {
                time = "\(information!.second_stage.burn_time_sec!) ч"
            }else {
                time = "Неизвестно"
            }
            
            
            
            cell.firstLeftLabel.text = "Кол-во двигателей"
            cell.firstRightLabel.text = "\(engeines)"
            
            cell.secondLeftLabel.text = "Кол-во топлива"
            cell.secondRightLabel.text = "\(tons)"
        
            cell.thirdLeftLabel.text = "Время сгорания"
            cell.thirdRightLabel.text = "\(time)"
            return cell
        }
    }
    
}

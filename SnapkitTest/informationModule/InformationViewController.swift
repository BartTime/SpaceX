//
//  InformationViewController.swift
//  SnapkitTest
//
//  Created by Alex on 15.08.2022.
//

import UIKit

class InformationViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        intital()
    }
    
    private func intital() {
        view.addSubview(tableView)
        tableView.register(InformationTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .black
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }

}

extension InformationViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .red
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .blue
        return footerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? InformationTableViewCell else { return UITableViewCell() }
        
        cell.contentView.layer.cornerRadius = 30
        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = #colorLiteral(red: 0.07834819704, green: 0.07867438346, blue: 0.08201599866, alpha: 1)
        cell.backgroundColor = .black
        
        if indexPath.section == 0 {
            cell.dateLabel.text = "2 февраяля, 2022"
            cell.rocketLabel.text = "FalconSat"
            cell.img.image = UIImage(named: "access")
        }else if indexPath.section == 1 {
            cell.dateLabel.text = "6 янваяря, 2022"
            cell.rocketLabel.text = "Heavy Holidays"
            cell.img.image = UIImage(named: "access")
        }else {
            cell.dateLabel.text = "23 декабря, 2021"
            cell.rocketLabel.text = "CRS-24 Mission"
            cell.img.image = UIImage(named: "failure")
        }

        return cell
    }
    
    
}

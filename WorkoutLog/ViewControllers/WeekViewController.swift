//
//  WeekViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/20/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WeekViewController: UITableViewController {
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly View"
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir Next Condensed", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    convenience init () {
        self.init(style: UITableView.Style.grouped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ColorTheme.lightGray1
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        setup()
        registerIds()
    }
    
    private func setup() {
//        view.addSubview(tempLabel)
//        
//        NSLayoutConstraint.activate([
//            tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            tempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
    }
    
    private func registerIds () {
        tableView.register(WeekHeaderView.self, forHeaderFooterViewReuseIdentifier: WeekHeaderView.id)
        tableView.register(WeekTableCell.self, forCellReuseIdentifier: WeekTableCell.id)
    }
    
}

extension WeekViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 52
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeekTableCell.id, for: indexPath) as! WeekTableCell
        cell.backgroundColor = .red
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: WeekHeaderView.id) as! WeekHeaderView
        header.contentView.backgroundColor = .blue
        return header
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25.0
    }
}

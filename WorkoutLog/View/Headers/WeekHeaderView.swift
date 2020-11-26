//
//  WeekHeaderView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 11/22/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WeekHeaderView: UITableViewHeaderFooterView {
    
    static let id = "WeekHeaderId"

    private lazy var monthLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir Next Condensed", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir Next Condensed", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.text = """
            Total Lifts: 205
            Total Miles: 365
            Total Run Time: 72:05
        """
        label.numberOfLines = 3
        label.font = UIFont(name: "Avenir Next Condensed", size: 12)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    public var month: Month? {
        didSet {
            guard let month = month else { return }
            monthLabel.text = "\(month.name)"
        }
    }
    
    public var year: Year? {
        didSet {
            guard let year = year else { return }
            yearLabel.text = "\(year.name)"
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
//    convenience init() {
//        self.init(style: .default ,reuseIdentifier: WeekTableCell.id)
//    }
    
    private func setup (){
        self.addSubview(monthLabel)
        self.addSubview(yearLabel)
        self.addSubview(detailsLabel)
        
        NSLayoutConstraint.activate([
            monthLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            monthLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            monthLabel.widthAnchor.constraint(equalToConstant: 130),
            monthLabel.heightAnchor.constraint(equalToConstant: 22.5),
            
            yearLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            yearLabel.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 5.0),
            yearLabel.widthAnchor.constraint(equalToConstant: 130),
            yearLabel.heightAnchor.constraint(equalToConstant: 22.5),
            
            detailsLabel.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor, constant: 0.0),
            detailsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            detailsLabel.widthAnchor.constraint(equalToConstant: 200),
            detailsLabel.heightAnchor.constraint(equalToConstant: 50.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

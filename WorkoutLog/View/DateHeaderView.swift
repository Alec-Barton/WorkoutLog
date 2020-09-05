//
//  MonthHeaderView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class DateHeaderView: UICollectionReusableView {
    
    static let id = "DateHeaderId"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir Next Condensed", size: 60)
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
            titleLabel.text = "\(month.name)"
        }
    }
    
    public var year: Year? {
        didSet {
            guard let year = year else { return }
            titleLabel.text = "\(year.name)"
        }
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup (){
        self.addSubview(titleLabel)
        self.addSubview(detailsLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30.0),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            titleLabel.widthAnchor.constraint(equalToConstant: 130),
            titleLabel.heightAnchor.constraint(equalToConstant: 50.0),
            
            detailsLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0.0),
            detailsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            detailsLabel.widthAnchor.constraint(equalToConstant: 200),
            detailsLabel.heightAnchor.constraint(equalToConstant: 50.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

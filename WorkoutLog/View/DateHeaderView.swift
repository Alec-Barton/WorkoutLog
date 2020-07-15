//
//  MonthHeaderView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class MonthHeaderView: UICollectionReusableView {
    
    static let id = "MonthHeaderId"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var month: Month? {
        didSet {
            guard let month = month else { return }
            titleLabel.text = "\(month.name)"
        }
    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup (){
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

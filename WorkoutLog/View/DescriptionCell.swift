//
//  DescriptionCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 8/15/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {
    static let id = "DescriptionCellId"
    
    private lazy var descriptionView: UITextView = {
        let view = UITextView()
        view.text = "Description"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
        self.addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: self.topAnchor),
            descriptionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

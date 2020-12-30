//
//  DayCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/20/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

protocol DateCollectionCellDelegate: AnyObject {
    func cellTapped (_ cell: DateCollectionCell)
}

class DateCollectionCell: UICollectionViewCell {
    
    static let id = "DateCellId"
    
    weak var delegate: DateCollectionCellDelegate?
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 8.0)
        label.textAlignment = .center
        return label
    }()
    
    var date: Date? {
        didSet {
            if let date = date {
                dateLabel.text = String(date.dayOfYear)
            } else {
                dateLabel.text = ""
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupGestures()
    }

    func setup () {
        self.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dateLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            dateLabel.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
        
        self.layer.cornerRadius = 4.0
    }
    
    func setupGestures (){
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.addGestureRecognizer(tap)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.date = nil
    }
    
    @objc private func tapped() {
        guard let delegate = delegate else { return }
        delegate.cellTapped(self)
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
}

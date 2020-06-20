//
//  ExerciseAddSetCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/14/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

//protocol SetAddCellDelegate: AnyObject {
//    func didTap(_ self: SetAddCell)
//}

class SetAddCell: UICollectionViewCell {
    
    static let id = "SetAddCellId"
    static let height: CGFloat = 40.0
    
//    var delegate: SetAddCellDelegate?
    
//    private lazy var addButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("+", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.black.cgColor
//        button.layer.cornerRadius = SetAddCell.height/2
//        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private lazy var addLabel: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = SetAddCell.height/2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(addLabel)
        NSLayoutConstraint.activate([
            addLabel.topAnchor.constraint(equalTo: self.topAnchor),
            addLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            addLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
//    @objc private func didTap() {
//        delegate?.didTap(self)
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

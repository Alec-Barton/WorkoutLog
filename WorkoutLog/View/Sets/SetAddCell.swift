//
//  ExerciseAddSetCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/14/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class SetAddCell: UICollectionViewCell {
    
    static let id = "SetAddCellId"
    static let height: CGFloat = 40.0
    
    private lazy var addImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "addIcon")
        view.tintColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

     override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(addImageView)
        NSLayoutConstraint.activate([
            addImageView.widthAnchor.constraint(equalToConstant: 20.0),
            addImageView.heightAnchor.constraint(equalToConstant: 20.0),
            addImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

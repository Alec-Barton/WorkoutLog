//
//  SetEditView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/20/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

protocol SetEditorViewDelegate: AnyObject {
    func save()
}

class SetEditorView: UIView {
    
//    static let height: CGFloat = 100.0
    
    var delegate: SetEditorViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "EDIT"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(saveDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.backgroundColor = .systemTeal
        
        addSubview(titleLabel)
        addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            saveButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            saveButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    @objc private func saveDidTap() {
        delegate?.save()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

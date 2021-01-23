//
//  EditorView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 1/17/21.
//  Copyright © 2021 Alec Barton. All rights reserved.
//

import UIKit

enum SetType {
    case rep, weightedRep, timed, timedRep, timedWeight
}

//open class EditorInputView: UIView {
//
//}
//
//class EditorView: UIView {
//
//}

class EditorViewController: UIViewController {
    
    private lazy var tempView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setup()
    }
    
    private func setup() {
        self.view.addSubview(tempView)
        
        NSLayoutConstraint.activate([
            tempView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tempView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tempView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tempView.topAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}



//
//  WorkoutViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/25/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class WorkoutViewController: UIViewController {
    
    var activity: WorkoutInstance?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .orange
//        guard let template = workoutTemplate else { return }
        let template = TemplateManager.shared.getTemplate(workoutNamed: "Chest Day")
        activity = WorkoutInstance(workout: template)
        
    }
    
}

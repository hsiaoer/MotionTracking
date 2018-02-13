/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 This class is responsible for managing interactions with the interface.
 */

import WatchKit
import Foundation
import Dispatch

class InterfaceController: WKInterfaceController, WorkoutManagerDelegate {
    // MARK: Properties

    let workoutManager = WorkoutManager()
    var active = false
    
    var gravityStr = ""
    var attitudeStr = ""
    var userAccelStr = ""
    var rotationRateStr = ""

    // MARK: Interface Properties
    
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var gravityLabel: WKInterfaceLabel!
    @IBOutlet weak var userAccelLabel: WKInterfaceLabel!
    @IBOutlet weak var rotationLabel: WKInterfaceLabel!
    @IBOutlet weak var attitudeLabel: WKInterfaceLabel!
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        workoutManager.delegate = self
    }

    // MARK: WKInterfaceController
    
    override func willActivate() {
        super.willActivate()
        active = true

        // On re-activation, update with the cached values.
        updateLabels()
    }

    override func didDeactivate() {
        super.didDeactivate()
        active = false
    }

    // MARK: Interface Bindings
    
    @IBAction func start() {
        titleLabel.setText("Tracking...")
        workoutManager.startWorkout()
    }

    @IBAction func stop() {
        titleLabel.setText("Stopped Recording")
        workoutManager.stopWorkout()
    }

    // MARK: WorkoutManagerDelegate
    func didUpdateMotion(_ manager: WorkoutManager, gravityStr: String, rotationRateStr: String, userAccelStr: String, attitudeStr: String) {
        DispatchQueue.main.async {
            self.gravityStr = gravityStr
            self.userAccelStr = userAccelStr
            self.rotationRateStr = rotationRateStr
            self.attitudeStr = attitudeStr
            self.updateLabels();
        }
    }

    // MARK: Convenience
    func updateLabels() {
        if active {
            gravityLabel.setText(gravityStr)
            userAccelLabel.setText(userAccelStr)
            rotationLabel.setText(rotationRateStr)
            attitudeLabel.setText(attitudeStr)
        }
    }

}

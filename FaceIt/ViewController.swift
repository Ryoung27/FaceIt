//
//  ViewController.swift
//  FaceIt
//
//  Created by Richard Young on 10/2/18.
//  Copyright © 2018 Richard Young. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController
{
    @IBOutlet weak var faceView: FaceView!{
        didSet {
            updateUI()
        }
    }
    
    var expression = FacialExpression(eyes: .open, mouth: .grin){
        didSet {
            updateUI()
        }
    }
    
    private func updateUI(){
        switch expression.eyes{
        case.open:
            faceView?.eyesOpen = true
        case.closed:
            faceView?.eyesOpen = false
        case .squinting:
            faceView?.eyesOpen = false
        }
        faceView.mouthCruvature = mouthCurvatures[expression.mouth] ?? 0.0
    }
    
    private let mouthCurvatures = [FacialExpression.Mouth.grin:0.5, .frown: -1.0, .smile: 1.0, neutraul:0.0,.smirk:-0.5]
    
}



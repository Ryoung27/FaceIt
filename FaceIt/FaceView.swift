//
//  FaceView.swift
//  FaceIt
//
//  Created by Richard Young on 10/2/18.
//  Copyright © 2018 Richard Young. All rights reserved.
//

import UIKit

class FaceView: UIView {

    
    var scale: CGFloat = 0.9
    
    var eyesOpen: Bool = false
    
    private var skullRadius: CGFloat {
        
    return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    private var skullCenter: CGPoint{
        return CGPoint(x: bounds.midX, y: bounds.midY)
        
    }
    
    private enum Eye {
        case left
        case right
    }
    
    private func pathForEye(_ eye: Eye) -> UIBezierPath{
        func centerOfeye(_ eye: Eye) -> CGPoint {
            let eyeOffset = skullRadius / Ratios.skullRadiusTOEyeOffset
            var eyeCenter = skullCenter
            eyeCenter.y -= eyeOffset
            eyeCenter.x += ((eye == .left) ? -1 : 1) * eyeOffset
            return eyeCenter
        }
        
        let eyeRadius = skullRadius / Ratios.skullRadiusToEyeRadius
        let eyeCenter = centerOfeye(eye)
        
        
        let path: UIBezierPath
        if eyesOpen {
            path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        } else{
            path = UIBezierPath()
            path.move(to: CGPoint(x: eyeCenter.x - eyeRadius, y:eyeCenter.y))
                path.addLine(to: CGPoint(x: eyeCenter.x + eyeRadius, y:eyeCenter.y))
            
        }
        path.lineWidth = 5.0
        
        return path
    }
    
    private func pathForMouth()
    
    private func pathForSkull() -> UIBezierPath{
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = 5.0
        return path
        

    }

    override func draw(_ rect: CGRect) {
        UIColor.blue.set()
        pathForSkull().stroke()
        pathForEye(.left).stroke()
        pathForEye(.right).stroke()
    }
    private struct Ratios {
        static let skullRadiusTOEyeOffset: CGFloat = 3
        static let skullRadiusToEyeRadius: CGFloat = 10
        static let skullRadiusToMouthWidth: CGFloat = 1
        static let skullRadiusToMouthHeight: CGFloat = 3
        static let skullRadiusToMouthOffset: CGFloat = 3
    }

}

//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Alexey Tsymlov on 3/19/15.
//  Copyright (c) 2015 Alexey Tsymlov. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    
    @IBOutlet weak var faceView: FaceView!{
        didSet{
            faceView.dataSource = self
        }
    }
    
    var happiness: Int = 100 {
        // 0 = vary sad, 100 = ecstatic
        didSet{
            happiness = min(max(happiness,0),100)
            println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI(){
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}

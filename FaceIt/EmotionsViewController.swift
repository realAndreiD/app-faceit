//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Mordre on 10/10/2017.
//  Copyright © 2017 Free. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        if let faceViewController = destinationViewController as? FaceViewController,
            let identifier = segue.identifier,
            let expression = emotionalFaces[identifier] {
            faceViewController.expression = expression
            faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
        }
    }
    
    private let emotionalFaces: Dictionary<String, FacialExpression> = [
        "sad": FacialExpression(eyes: .Closed, eyeBrows: .Normal, mouth: .Frown),
        "happy": FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smile),
        "worried": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Smirk)
    ]
    
}

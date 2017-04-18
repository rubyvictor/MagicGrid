//
//  ViewController.swift
//  MagicGrid
//
//  Created by Victor Lee on 18/4/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...5 {
            let redView = UIView()
            redView.backgroundColor = randomColor()
            redView.frame = CGRect(x: i * 100, y: 0, width: 100, height: 100)
            view.addSubview(redView)
            
        }
        
        
    }
    
    fileprivate func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }


}


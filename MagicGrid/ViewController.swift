//
//  ViewController.swift
//  MagicGrid
//
//  Created by Victor Lee on 18/4/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    let numViewPerRow = 15
    var cells = [String: UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let width = view.frame.width / CGFloat(numViewPerRow)
        
        
        for j in 0...30 {
            for i in 0...numViewPerRow {
                let cellView = UIView()
                cellView.backgroundColor = randomColor()
                cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                view.addSubview(cellView)
                
                let key = "\(i)|\(j)"
                cells[key] = cellView
                
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    func handlePan(gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
        //print(location)
        
        //Get exact column and row of point
        let width = view.frame.width / CGFloat(numViewPerRow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        print(i,j)

        let key = "\(i)|\(j)"
        let cellView = cells[key]
        cellView?.backgroundColor = .white
        
        
        
//        var loopCount = 0
//        
//        for subview in view.subviews {
//            //use contains(point: CFPoint) to reference location which is the point we are touching
//            if subview.frame.contains(location) {
//              subview.backgroundColor = .black
////                print("loopCount:", loopCount)
//            
//            }
//            loopCount += 1
//            
//        }
    }
    
    fileprivate func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }


}


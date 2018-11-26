//
//  ViewController.swift
//  MagicGrid
//
//  Created by Victor Lee on 18/4/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    let numViewPerRow = 26
    let numViewPerColumn = 110
    var cells = [String: UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        let container = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        
        container.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 1000)
        container.backgroundColor = .clear
        let width = container.frame.width / CGFloat(numViewPerRow)
        view.addSubview(container)
        
        for j in 0...numViewPerColumn {
            for i in 0...numViewPerRow {
                let cellView = UIView()
                cellView.backgroundColor = .yellow
                cellView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
                container.addSubview(cellView)
                
                let key = "\(i)|\(j)"
                cells[key] = cellView
                print(key)
            }
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    var selectedCell: UIView?
    
    
    func handlePan(gesture: UIPanGestureRecognizer) {
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        let container = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        container.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 1000)
        let location = gesture.location(in: container)
        //print(location)
        
        
        
        //Get exact column and row of point
        let width = container.frame.width / CGFloat(numViewPerRow)
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        print(i,j)

        let key = "\(i)|\(j)"
        guard let cellView = cells[key] else { return }
        
        if selectedCell != cellView {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                self.selectedCell?.layer.transform = CATransform3DIdentity
                
            }, completion: nil)
        }
        //As we are touching, set the cell to cellView, and line 59 above will constantly trigger as our finger leaves the cellView
        selectedCell = cellView
        
        view.bringSubview(toFront: cellView)

        //        cellView?.backgroundColor = .white
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            cellView.layer.transform = CATransform3DMakeScale(3, 3, 3)
            
            
        }, completion: {(_) in
        
        })
        
        if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                cellView.layer.transform = CATransform3DIdentity
                
            }, completion: nil)
            
        }
        
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


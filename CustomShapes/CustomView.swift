//
//  CustomView.swift
//  CustomShapes
//
//  Created by Ferdi Sonmezay on 01/03/17.
//  Copyright © 2017 Ferdi Sonmezay. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override func draw(_ rect: CGRect) {
        
        // Drawing code
        UIColor(red:255/255, green: 255/255, blue: 255/255, alpha: 0.1).set()
        createCustomPath(padding: 15, startY: 220, endY: 190).fill()
        UIColor(red:255/255, green: 255/255, blue: 255/255, alpha: 0.2).set()
        createCustomPath(padding: 15, startY: 240, endY: 260).fill()
        createCustomPath(padding: 15, startY: 265, endY: 190).fill()
        createCustomPath(padding: 15, startY: 270, endY: 290).fill()
        
        UIColor(red:240/255, green: 240/255, blue: 240/255, alpha: 1).set()
        createCustomPath(padding: 15, startY: 340, endY: 190).fill()
        
    }
    
    func createCustomPath(padding: CGFloat, startY: CGFloat, endY: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.minX + padding, y: bounds.minY + startY))
        path.addLine(to: CGPoint(x: bounds.minX + padding, y: bounds.maxY - padding))
        path.addLine(to: CGPoint(x: bounds.maxX - padding, y: bounds.maxY - padding))
        path.addLine(to: CGPoint(x: bounds.maxX - padding, y: bounds.minY + endY))
        path.close()
        return path
    }

}

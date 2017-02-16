//
//  CustomSegmentControl.swift
//  AirgChatClient
//
//  Created by Steven Thompson on 2016-04-27.
//  Copyright © 2016 Steven Thompson. All rights reserved.
//

import UIKit

open class CustomSegmentControl: UIControl {
    var segmentAnimationTime = 0.2

    public var segments: [String] = [] {
        didSet {
            setupView()
        }
    }
    
    public fileprivate(set) var selectedSegmentIndex: Int = 0
    
    fileprivate let bottomLine: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        return v
    }()
    
    fileprivate var bottomLineConstraints: [NSLayoutConstraint] = []

    fileprivate func setupView() {
        backgroundColor = .orange
        addSubview(bottomLine)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[line(2)]-(0)-|", options: [], metrics: nil, views: ["line": bottomLine]))
        
        var previousButton: UIButton?
        
        for (index, title) in segments.enumerated() {
            let button = UIButton()
            button.setAttributedTitle(NSAttributedString(string: title, attributes: [NSForegroundColorAttributeName: UIColor.darkGray]), for: UIControlState())
            button.setAttributedTitle(NSAttributedString(string: title, attributes: [NSForegroundColorAttributeName: UIColor.white]), for: .selected)
            button.setAttributedTitle(NSAttributedString(string: title, attributes: [NSForegroundColorAttributeName: UIColor.white]), for: .highlighted)
            button.tintColor = .darkGray
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            addSubview(button)
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[b]|", options: [], metrics: nil, views: ["b": button]))
            
            switch index {
            case 0:
                addConstraint(NSLayoutConstraint(item: bottomLine, attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1, constant: 0))
                
                addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[b]", options: [], metrics: nil, views: ["b": button]))
                
            case 1..<segments.count-1:
                addConstraint(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: previousButton, attribute: .width, multiplier: 1, constant: 0))
                addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[previousB][b]", options: [], metrics: nil, views: ["previousB": previousButton!, "b": button]))
                
            case segments.count-1:
                addConstraint(NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: previousButton, attribute: .width, multiplier: 1, constant: 0))
                addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[previousB][b]|", options: [], metrics: nil, views: ["previousB": previousButton!, "b": button]))
                
            default:
                fatalError("Shouldn't get here")
            }
            let centerLine = NSLayoutConstraint(item: bottomLine, attribute: .centerX, relatedBy: .equal, toItem: button, attribute: .centerX, multiplier: 1, constant: 0)
            centerLine.priority = 250
            addConstraint(centerLine)
            bottomLineConstraints.append(centerLine)
            
            if selectedSegmentIndex == index {
                button.isSelected = true
                constrainBottomLine(index)
            }
            
            previousButton = button
        }
    }
    
    func buttonTapped(_ sender: UIButton) {
        if selectedSegmentIndex == sender.tag {
            return
        }
        selectIndex(sender.tag)
    }
    
    public func selectIndex(_ index: Int) {
        selectedSegmentIndex = index
        
        for button in subviews where button is UIButton {
            let b = button as! UIButton
            
            if b.tag != index {
                b.isSelected = false
            } else {
                b.isSelected = true
            }
        }
        constrainBottomLine(selectedSegmentIndex)
        sendActions(for: .valueChanged)
    }
    
    fileprivate func constrainBottomLine(_ toIndex: Int) {
        self.layoutIfNeeded()
        
        UIView.animate(withDuration: segmentAnimationTime, animations: {
            for (index, constraint) in self.bottomLineConstraints.enumerated() {
                if index != toIndex {
                    constraint.priority = 250
                } else {
                    constraint.priority = 750
                }
            }
            
            self.layoutIfNeeded()
        }) 
    }
}

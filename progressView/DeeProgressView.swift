//
//  DeeProgressView.swift
//  delProgress
//
//  Created by quan on 2019/9/26.
//  Copyright © 2019 quan. All rights reserved.
//

import UIKit

class DeeProgressView: UIView {
    public var progreeeBackgroundColor: UIColor! {
        didSet {
            DispatchQueue.main.async {
                 self.backgroundColor = self.progreeeBackgroundColor
            }
        }
    }
    public var progressTintColor: UIColor! {
        didSet {
            self.updateProgress()
        }
    }
    
    public var progress: CGFloat = 0.0 {
        didSet {
            self.updateProgress()
        }
    }
    
    private var progressLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.basicSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.basicSetup()
    }
    
    private func basicSetup() {
        progreeeBackgroundColor = UIColor(red: 46/255.0, green: 77/255.0, blue: 123/255.0, alpha: 1.0)
        progressTintColor = UIColor(red: 25/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = self.bounds.size
        self.layer.masksToBounds = true
        self.layer.cornerRadius = size.height/2.0
        self.progressLayer.frame = CGRect(x: 0, y: 0, width: size.width*progress, height: size.height)
        self.progressLayer.path = UIBezierPath(roundedRect: progressLayer.frame, cornerRadius: size.height/2.0).cgPath
        self.progressLayer.fillColor = progressTintColor.cgColor
        if self.progressLayer.superlayer == nil {
            self.layer.addSublayer(progressLayer)
        }
        
    }
    
    private func updateProgress() {
        DispatchQueue.main.async {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
}

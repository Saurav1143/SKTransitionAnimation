//
//  SKTransitionAnimation.swift
//  SauravRotatedView
//
//  Created by Sourav on 3/9/19.
//  Copyright © 2019 Saurav. All rights reserved.
//

import UIKit



class SKTranstionAnimation: UIView {
    
    //MARK:- Variables.....
    
    private var timer = Timer()
    private var skImageView = UIImageView()
    private var switchImage:Bool = true
    private var duration:Double = 0.8
    
    //You can change according to you....
    public var firstImage = UIImage(named: "skImage")
    public var secondImage = UIImage(named: "skImage")
    
    
    //MARK:- App life Cycle.....
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        intializeData()
    }
    
    deinit {
        timer.invalidate()
    }
    
    //MARK:- Custom Methods....
    private func intializeData() {
        //This Loop Will remove All add SubViews...
        for subView in self.subviews {
            subView.removeFromSuperview()
        }
        skImageView.frame = self.bounds
        skImageView.contentMode = .scaleAspectFit
        self.backgroundColor = UIColor.clear
        skImageView.image = firstImage
        self.addSubview(skImageView)
        scheduledTimerWithTimeInterval()
    }
    
   private func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(duration), target: self, selector: #selector(flipView), userInfo: nil, repeats: true)
    }
    
   @objc func flipView() {
    
      //This Can change According to you ...
    
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromLeft,.showHideTransitionViews,]
        
        UIView.transition(with: self, duration: duration, options: transitionOptions, animations: {
            if (self.switchImage) {
                self.skImageView.image = self.secondImage
                self.switchImage = !self.switchImage
            } else {
                self.skImageView.image = self.firstImage
                self.switchImage = !self.switchImage
            }
        })
    }
}

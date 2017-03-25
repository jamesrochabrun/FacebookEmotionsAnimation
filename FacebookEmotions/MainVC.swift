//
//  ViewController.swift
//  FacebookEmotions
//
//  Created by James Rochabrun on 3/24/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    lazy var buyButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(performHandler), for: .touchUpInside)
        b.layer.cornerRadius = 25
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("LIKE", for: .normal)
        b.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.2431372549, blue: 0.6470588235, alpha: 1)
        return b
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "car")
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(buyButton)
        view.addSubview(imageView)
        
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        buyButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func performHandler() {
        (0...50).forEach { (_) in
            generateAnimatedViews({ (imageView) in
                UIView.animate(withDuration: 1.5) {
                    imageView.alpha = 0
                }
            })
        }
    }
    
    func generateAnimatedViews(_ completion:(_ imageView: UIImageView) -> Void) {
        
        let images = [#imageLiteral(resourceName: "star")]
        let index = Int(arc4random_uniform(UInt32(images.count)))
        print(index)
        let image = images[index]
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPathFromButton().cgPath
        animation.duration = drand48() + 0.7
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation , forKey: nil)
        view.addSubview(imageView)
        completion(imageView)
    }
    
    func generate(function: (_ bool: Bool) -> Void) {
        let images = [#imageLiteral(resourceName: "star")]
        let index = Int(arc4random_uniform(UInt32(images.count)))
        print(index)
        let image = images[index]
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPathFromButton().cgPath
        animation.duration = drand48() + 0.7
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation , forKey: nil)
        view.addSubview(imageView)
        
        UIView.animate(withDuration: animation.duration) {
            imageView.alpha = 0
        }
        
    }
    
    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        let randomX: CGFloat = CGFloat(drand48()) * self.view.frame.width
        path.move(to: CGPoint(x: randomX, y: self.view.frame.maxY))
        let endPoint = CGPoint(x: randomX, y: self.view.frame.minY)
    
        let cp1RandomX: CGFloat = CGFloat(drand48()) * self.view.frame.width
        let cpiRandomY: CGFloat = CGFloat(drand48()) * self.view.frame.height
        let cp2RandomX: CGFloat = CGFloat(drand48()) * self.view.frame.width
        let cp2RandomY: CGFloat = CGFloat(drand48()) * self.view.frame.height
        
        let cp1 = CGPoint(x: cp1RandomX, y: cpiRandomY)
        let cp2 = CGPoint(x: cp2RandomX, y: cp2RandomY)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
    
    func customPathFromButton() -> UIBezierPath {
        let path = UIBezierPath()
        
        let randomButtonX: CGFloat = CGFloat(drand48()) * self.buyButton.frame.size.width
        let buttonOriginX: CGFloat = self.buyButton.frame.origin.x
        path.move(to: CGPoint(x: buttonOriginX + randomButtonX , y: self.buyButton.frame.origin.y))
        
        let randomEndPointX:  CGFloat = CGFloat(drand48()) * self.view.frame.size.width
        let endPoint = CGPoint(x: randomEndPointX, y: self.view.frame.minY)
        
        let cp1RandomX: CGFloat = CGFloat(drand48()) * self.view.frame.width
        let cpiRandomY: CGFloat = CGFloat(drand48()) * self.buyButton.frame.origin.y
        let cp2RandomX: CGFloat = CGFloat(drand48()) * self.view.frame.width
        let cp2RandomY: CGFloat = CGFloat(drand48()) * self.buyButton.frame.origin.y
        
        let cp1 = CGPoint(x: cp1RandomX, y: cpiRandomY)
        let cp2 = CGPoint(x: cp2RandomX, y: cp2RandomY)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        
        return path
    }
    

}




























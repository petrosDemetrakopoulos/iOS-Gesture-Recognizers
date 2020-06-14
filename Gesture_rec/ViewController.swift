//
//  ViewController.swift
//  Gesture_rec
//
//  Created by Demetrakopoulos Petros on 7/17/14.
//  Copyright (c) 2014 PSD Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tapView: UIView!
    @IBOutlet var swipeView: UIView!
    @IBOutlet var longPressView: UIView!
    @IBOutlet var pinchView: UIView!
    @IBOutlet var rotateView: UIView!
    @IBOutlet var panView: UIView!
    var rotation = CGFloat()
    let tapRec = UITapGestureRecognizer()
    let pinchRec = UIPinchGestureRecognizer()
    let swipeRec = UISwipeGestureRecognizer()
    let longPressRec = UILongPressGestureRecognizer()
    let rotateRec = UIRotationGestureRecognizer()
    let panRec = UIPanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        tapRec.addTarget(self, action: #selector(tappedView))
        pinchRec.addTarget(self, action: #selector(pinchedView))
        swipeRec.addTarget(self, action: #selector(swipedView))
        longPressRec.addTarget(self, action: #selector(longPressedView))
        rotateRec.addTarget(self, action: #selector(rotatedView))
        panRec.addTarget(self, action: #selector(draggedView))
        tapView.addGestureRecognizer(tapRec)
        swipeView.addGestureRecognizer(swipeRec)
        pinchView.addGestureRecognizer(pinchRec)
        longPressView.addGestureRecognizer(longPressRec)
        rotateView.addGestureRecognizer(rotateRec)
        rotateView.isUserInteractionEnabled = true
        rotateView.isUserInteractionEnabled = true
        pinchView.isUserInteractionEnabled = true
        pinchView.isUserInteractionEnabled = true
        tapView.isUserInteractionEnabled = true;
        swipeView.isUserInteractionEnabled  = true
        longPressView.isUserInteractionEnabled = true
        panView.isUserInteractionEnabled = true
        panView.addGestureRecognizer(panRec)
        // Do any additional setup after loading th3e view, typically from a nib.
    }
    @objc func tappedView(){
        let tapAlert = UIAlertController(title: "Tapped", message: "You just tapped the tap view", preferredStyle: UIAlertControllerStyle.alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(tapAlert, animated: true, completion: nil)
    }
    @objc func swipedView(){
        let tapAlert = UIAlertController(title: "Swiped", message: "You just swiped the swipe view", preferredStyle: UIAlertControllerStyle.alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(tapAlert, animated: true, completion: nil)
    }
    @objc func longPressedView(){
        let tapAlert = UIAlertController(title: "Long Pressed", message: "You just long pressed the long press view", preferredStyle: UIAlertControllerStyle.alert)
        tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(tapAlert, animated: true, completion: nil)
    }
    @objc func rotatedView(sender:UIRotationGestureRecognizer){
        var lastRotation = CGFloat()
        self.view.bringSubview(toFront: rotateView)
        if(sender.state == UIGestureRecognizerState.ended){
            lastRotation = 0.0;
        }
        rotation = 0.0 - (lastRotation - sender.rotation)
        _ = rotateRec.location(in: rotateView)
        let currentTrans = sender.view!.transform
        let newTrans = currentTrans.rotated(by: rotation)
        
        sender.view!.transform = newTrans
        lastRotation = sender.rotation
        
    }
    @objc func pinchedView(sender:UIPinchGestureRecognizer){
        self.view.bringSubview(toFront: pinchView)
        sender.view!.transform = sender.view!.transform.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1.0
        
    }
    @objc func draggedView(sender:UIPanGestureRecognizer){
        self.view.bringSubview(toFront: sender.view!)
        let translation = sender.translation(in: self.view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(CGPoint(x: 0, y: 0), in: self.view)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


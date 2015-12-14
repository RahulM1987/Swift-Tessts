//
//  Animation.swift
//  Swift2Test
//
//  Created by Rahul on 12/9/15.
//  Copyright © 2015 Rahul M. All rights reserved.
//

import UIKit

class Animation: UIViewController {

    @IBOutlet weak var ImageA: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var Fade: UIButton!
    
    @IBAction func fade(sender: AnyObject) {
        UIView.animateWithDuration(1.2, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            self.ImageA.alpha = 0.0
            
            }, completion: nil)
    }
    
    @IBAction func Rotate(sender: AnyObject){
        UIView.animateWithDuration(0.25, animations:{
             self.ImageA.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
        })
    }
    
    @IBAction func Transform(sender: AnyObject){
        UIView.animateWithDuration(0.25, animations:{
            self.ImageA.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        })
        
    }
    
    
    @IBAction func Pop(sender: AnyObject){

        self.ImageA.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(1.2, delay: 0.0, usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.6, options: [], animations:
            {
                self.ImageA.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
        
//        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 7.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
//            self.ImageA.transform = CGAffineTransformMakeScale(0.6, 0.6)
//            }), completion: { finish in
//            UIView.animateWithDuration(0.6){
//                self.ImageA.transform = CGAffineTransformIdentity
//            }
//        })

    }
    
    @IBAction func Grow(sender: AnyObject){
                UIView.animateWithDuration(0.6 ,
                    animations: {
                        self.ImageA.transform = CGAffineTransformMakeScale(0.6, 0.6)
                    },
                    completion: { finish in
                        UIView.animateWithDuration(0.6){
                            self.ImageA.transform = CGAffineTransformIdentity
                        }
                })
    }
    
    @IBAction func Discloa(sender: AnyObject){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

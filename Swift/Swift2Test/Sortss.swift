//
//  Sortss.swift
//  Swift2Test
//
//  Created by Rahul on 12/14/15.
//  Copyright © 2015 Rahul M. All rights reserved.
//

import UIKit

class Sortss: UIViewController {

    @IBOutlet weak var Ascendingorder: UILabel!
    var SortArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SortArray = [40,10,30,20,50,60]
        // Do any additional setup after loading the view.
        let converted = "\(SortArray)"
        self.Ascendingorder.text = converted
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var close: UIButton!
    @IBAction func Close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func Ascending(sender: AnyObject) {
        
        print("Before \(SortArray)")
        var x, y, key : Int
        for (x = 0; x < SortArray.count; x++) { //obtain a key to be evaluated
            key = SortArray[x]  as! Int //iterate backwards through the sorted portion
            
            for (y = x; y > -1; y--)
            {
                if (key < SortArray[y] as! Int)
                {
                    SortArray.removeObjectAtIndex(y + 1)       //remove item from original position
                    SortArray.insertObject(key, atIndex: y)   //insert the number at the key position
                }
                
            }
        }
        print("After \(SortArray)")
        
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

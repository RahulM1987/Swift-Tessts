//
//  ViewController.swift
//  Swift2Test
//
//  Created by Rahul's MacBook Pro on 05/12/15.
//  Copyright © 2015 Rahul M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var Table: UIButton!
    
    
    @IBAction func TableViewshow(sender: AnyObject) {
        
        let vc = TablesViewController(nibName:"TablesViewController", bundle:nil) //change this to your class name
        let Nvc = UINavigationController(rootViewController: vc)
        self.presentViewController(Nvc, animated: true, completion: nil)
    }
    
    
    @IBAction func Sortsss(sender: AnyObject) {
        
        let Vc1 = Sortss(nibName: "Sortss" ,bundle: nil)
        self.presentViewController(Vc1, animated: true, completion: nil)
        
    }
    
    
    
}


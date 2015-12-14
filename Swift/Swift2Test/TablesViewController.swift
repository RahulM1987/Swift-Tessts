//
//  TablesViewController.swift
//  Swift2Test
//
//  Created by Rahul's MacBook Pro on 05/12/15.
//  Copyright © 2015 Rahul M. All rights reserved.
//

import UIKit

class TablesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabled: UITableView!
    var List: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabled.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "Done")

        List = ["Slider and Picker","Animation","Core Data- In Progress","SQL Lite - In Progress","Collection View - In Progress","Weather"]
    }
    
    func Done()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return List.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = List.objectAtIndex(indexPath.row) as? String
        print("---- \(List.objectAtIndex(indexPath.row))")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 0){
        let SldPc = SlidPick()
        self.navigationController?.pushViewController(SldPc, animated: true)
        }
        
        if(indexPath.row == 1){
            let Anim = Animation()
            self.navigationController?.pushViewController(Anim, animated: true)
            
        }
        
        
        if(indexPath.row == 5){
            let weat = Weather()
            self.navigationController?.pushViewController(weat, animated: true)

        }
        
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

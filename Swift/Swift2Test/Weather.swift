//
//  Weather.swift
//  Swift2Test
//
//  Created by Rahul on 12/9/15.
//  Copyright © 2015 Rahul M. All rights reserved.
//

import UIKit

class Weather: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var cityname: UITextField!
    @IBOutlet weak var tableWeather: UITableView!
    var EncodeS: String!
    var DayTemp: NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableWeather.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count is:\(DayTemp.count)")
        return DayTemp.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        //        cell.textLabel?.text = WeatherArray.objectAtIndex(indexPath.row) as? String
//        print("---- \(self.DayTemp.objectAtIndex(indexPath.row))")
        cell.textLabel?.text = self.DayTemp.objectAtIndex(indexPath.row) as? String
//        cell.textLabel?.text = "Rahul"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(indexPath.row == 0){
            let SldPc = SlidPick()
            self.navigationController?.pushViewController(SldPc, animated: true)
        }
    }
    
    @IBAction func GetWeather(sender: AnyObject) {
        self.GetWeatherData()
    }
    
    
    func GetWeatherData()
    {
        EncodeS = String(format: "http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&cnt=16&APPID=3295d12062ce30fd33b2b0c35a4f7235", self.cityname.text!)
        print("String is : \(EncodeS)")
        let url = NSURL(string: EncodeS)
        print("----- \(url)")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!)
            {(data, response, error) in
                //            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                
                do {
                    let jsondata = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                    // use anyObj here
                    print("Json Resopons:\(jsondata)")
                    
                    let ListArray: NSMutableArray = jsondata.valueForKey("list") as! NSMutableArray
                    for var indx = 0; indx < ListArray.count; indx++
                    {
                        let DayT = ListArray.objectAtIndex(indx) .valueForKey("temp") as! NSMutableDictionary
                        let a = DayT.valueForKey("day") as! NSNumber
                        let Temm = "Day Temperature: \(a)"
                        self.DayTemp.addObject(Temm)
                        //                        print(DayT)
                    }
                    print("This is  temp:\(self.DayTemp)")
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableWeather.reloadData()
                    })
                } catch {
                    print("json error: \(error)")
                }
        }
        task.resume()
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

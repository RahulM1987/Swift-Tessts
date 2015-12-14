//
//  SlidPick.swift
//  Swift2Test
//
//  Created by Rahul's MacBook Pro on 08/12/15.
//  Copyright © 2015 Rahul M. All rights reserved.
//

import UIKit

class SlidPick: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var sliderr: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var PickrView: UIPickerView!
    @IBOutlet weak var PickerValue: UILabel!
    var PickerList: NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        PickerList = ["One","Two","Three","Four","Five","EDEDE"]
        sliderValue.text = String(format: "Slider Value:%.2f",sliderr.value)
        PickerValue.text = String(format: "Picker Value:\(PickerList.objectAtIndex(0))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Slide(sender: AnyObject) {
        
        sliderValue.text = String(format: "Slider Value:%.2f",sliderr.value)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerList.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerList.objectAtIndex(row) as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        PickerValue.text = String(format: "Picker Value:\(PickerList.objectAtIndex(row))")
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

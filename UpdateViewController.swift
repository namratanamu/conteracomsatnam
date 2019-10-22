//
//  UpdateViewController.swift
//  Conterramchnetest
//
//  Created by Felix 05 on 25/08/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController
{
    var WeakDataArray = [String]()
    var WeakArrayAddData = [String]()
    var evday:Int!
    var mnday:Int!
    
    var sname:String!
    
    
    @IBOutlet weak var DeleteU: UIButton!
    @IBAction func DeleteAction(_ sender: UIButton)
    {
        let delete = "delete from Schedule where Schedule_Name = '\(ScheduleNameU.text!)'"
        let isSuccess = DBWrapper.sharedObj.executeQuery(query: delete)
        if isSuccess
        {
            print("Delete: Success......")
            //ClearData()
        }
        else
        {
            print("Failed")
        }
        
    }
    
    @IBOutlet weak var ScheduleNameU: UITextField!
    @IBOutlet weak var ScheduleTimeU: UITextField!
    @IBAction func Scheduletime(_ sender: UIButton)
    {
        if DateorTime.isHidden == true
        {
            DateorTime.isHidden = false
        }
        else
        {
            DateorTime.isHidden = true
        }
    }
    @IBOutlet weak var DateorTime: UIDatePicker!
    @IBAction func DateORTime(_ sender: UIDatePicker)
    {
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let currentTime = timeFormatter.string(from: DateorTime.date)
        ScheduleTimeU.text = currentTime
        DateorTime.isHidden = true
    }
    @IBAction func EverydayAction(_ sender: UIButton)
    {
        let evrdy = "Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday"
        if EverydayU.backgroundColor == UIColor.white
        {
            EverydayU.backgroundColor = UIColor.green
            MondayU.backgroundColor = UIColor.green
           tuesdayU.backgroundColor = UIColor.green
            WednesdayU.backgroundColor = UIColor.green
            ThursdayU.backgroundColor = UIColor.green
            FridayU.backgroundColor = UIColor.green
            saturdayU.backgroundColor = UIColor.green
            SundayU.backgroundColor = UIColor.green
            WeakDataArray.append(evrdy)
            evday = 11
        }
        else if EverydayU.backgroundColor == UIColor.green
        {
            EverydayU.backgroundColor = UIColor.white
            MondayU.backgroundColor = UIColor.white
           tuesdayU.backgroundColor = UIColor.white
            WednesdayU.backgroundColor = UIColor.white
            ThursdayU.backgroundColor = UIColor.white
            FridayU.backgroundColor = UIColor.white
           saturdayU.backgroundColor = UIColor.white
            SundayU.backgroundColor = UIColor.white
            let i = WeakDataArray.index(of: evrdy)
            WeakDataArray.remove(at: i!)
        }
    }
    @IBOutlet weak var EverydayU: UIButton!
    @IBOutlet weak var MondayU: UIButton!
    @IBOutlet weak var tuesdayU: UIButton!
    @IBOutlet weak var WednesdayU: UIButton!
    @IBOutlet weak var ThursdayU: UIButton!
    @IBOutlet weak var FridayU: UIButton!
    @IBOutlet weak var saturdayU: UIButton!
    @IBOutlet weak var SundayU: UIButton!
    @IBAction func MondayAction(_ sender: UIButton)
    {
        let mon  = "Monday"
        if MondayU.backgroundColor == UIColor.white
        {
            MondayU.backgroundColor = UIColor.green
            WeakArrayAddData.append(mon)
            mnday = 22
        }
        else if MondayU.backgroundColor == UIColor.green
        {
            MondayU.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: mon)
            WeakArrayAddData.remove(at: i!)
        }
    }
    @IBAction func TuesdayAction(_ sender: UIButton)
    {
        let tue  = "Tuesday"
        if tuesdayU.backgroundColor == UIColor.white
        {
            tuesdayU.backgroundColor = UIColor.green
            WeakArrayAddData.append(tue)
            mnday = 22
        }
        else if tuesdayU.backgroundColor == UIColor.green
        {
           tuesdayU.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: tue)
            WeakArrayAddData.remove(at: i!)
        }
        
    }
    @IBAction func WednesdayAction(_ sender: UIButton)
    {
        let Wed = "Wednesday"
        if WednesdayU.backgroundColor == UIColor.white
        {
            WednesdayU.backgroundColor = UIColor.green
            WeakArrayAddData.append(Wed)
            mnday = 22
        }
        else if WednesdayU.backgroundColor == UIColor.green
        {
           WednesdayU.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: Wed)
            WeakArrayAddData.remove(at: i!)
        }
    }
    @IBAction func ThursdayAction(_ sender: UIButton)
    {
        let thur = "Thursday"
        if ThursdayU.backgroundColor == UIColor.white
        {
           ThursdayU.backgroundColor = UIColor.green
            WeakArrayAddData.append(thur)
            mnday = 22
        }
        else if ThursdayU.backgroundColor == UIColor.green
        {
           ThursdayU.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of:thur)
            WeakArrayAddData.remove(at: i!)
        }
    }
    @IBAction func FridayAction(_ sender: UIButton)
    {
        let Fri = "Friday"
        if FridayU.backgroundColor == UIColor.white
        {
         FridayU.backgroundColor = UIColor.green
            WeakArrayAddData.append(Fri)
            mnday = 22
        }
        else if FridayU.backgroundColor == UIColor.green
        {
           FridayU.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: Fri)
            WeakArrayAddData.remove(at: i!)
        }
        
    }
    @IBAction func SaturdayAction(_ sender: UIButton)
    {
        let Sat = "Saturday"
        if saturdayU.backgroundColor == UIColor.white
        {
            saturdayU.backgroundColor = UIColor.green
            WeakArrayAddData.append(Sat)
            mnday = 22
        }
        else if saturdayU.backgroundColor == UIColor.green
        {
           saturdayU.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: Sat)
            WeakArrayAddData.remove(at: i!)
        }
    }
    @IBAction func SundayAction(_ sender: UIButton)
    {
        let Sun = "Sunday"
        if SundayU.backgroundColor == UIColor.white
        {
         SundayU.backgroundColor = UIColor.green
            WeakArrayAddData.append(Sun)
            mnday = 22
        }
        else if SundayU.backgroundColor == UIColor.green
        {
            SundayU.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of:Sun)
            WeakArrayAddData.remove(at: i!)
        }
    }
    @IBOutlet weak var Updateoutlet: UIButton!
    @IBAction func UpdateAction(_ sender: UIButton)
    {
        
        if mnday == 22
        {
            let joined = WeakArrayAddData.joined(separator: ",")
            print(joined)
            let update = "update Schedule set Time ='\(ScheduleTimeU.text!)' where Schedule_Name = '\(ScheduleNameU.text!)'"
            let isSuccess = DBWrapper.sharedObj.executeQuery(query: update)
            if isSuccess
            {
                print("Update: Success *******")
            //    ClearData()
            }
            else
            {
                print("Failed")
            }
            WeakDataArray.removeAll()
        }
        else if evday == 11
        {
            print(WeakDataArray)
            WeakArrayAddData.removeAll()
            
            let joined1 = WeakDataArray.joined(separator: ",")
            print(joined1)
            let update = "update Schedule set Time = '\(ScheduleTimeU.text!)', Day = '\(joined1)' where Schedule_Name = '\(ScheduleNameU.text!)'"
            let isSuccess = DBWrapper.sharedObj.executeQuery(query: update)
            if isSuccess
            {
                print("Update: Success......")
                
                navigationController?.popViewController(animated: true)
                //ClearData()
            }
            else
            {
                print("Failed")
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        
        ScheduleNameU.text = sname
        
        
     EverydayU.layer.cornerRadius = 15
    MondayU.layer.cornerRadius = 15
    tuesdayU.layer.cornerRadius = 15
    WednesdayU.layer.cornerRadius = 15
    ThursdayU.layer.cornerRadius = 15
    FridayU.layer.cornerRadius = 15
    saturdayU.layer.cornerRadius = 15
    SundayU.layer.cornerRadius = 15
    Updateoutlet.layer.cornerRadius = 15
        DeleteU.layer.cornerRadius = 15
        
        EverydayU.layer.borderWidth = 1
        MondayU.layer.borderWidth = 1
        tuesdayU.layer.borderWidth = 1
        WednesdayU.layer.borderWidth = 1
       ThursdayU.layer.borderWidth = 1
        FridayU.layer.borderWidth = 1
        saturdayU.layer.borderWidth = 1
        SundayU.layer.borderWidth = 1
        Updateoutlet.layer.borderWidth = 1
        DeleteU.layer.borderWidth = 1
        
       MondayU.backgroundColor = UIColor.white
        tuesdayU.backgroundColor = UIColor.white
        WednesdayU.backgroundColor = UIColor.white
        ThursdayU.backgroundColor = UIColor.white
        FridayU.backgroundColor = UIColor.white
    saturdayU.backgroundColor = UIColor.white
        SundayU.backgroundColor = UIColor.white
        EverydayU.backgroundColor = UIColor.white
        
        
        DateorTime.isHidden = true
        
        //Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}

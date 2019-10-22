//
//  ScreenTwoViewController.swift
//  Conterramchnetest
//
//  Created by Felix 05 on 11/08/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class ScreenTwoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource
{
    var schedulearray = [String]()
    
    
    
    @IBOutlet weak var Scheduletextfield: UITextField!
    
   //TEXTFIELDS
    
    
    @IBOutlet weak var SelectRoomDatatxt: UITextField!
    
    @IBOutlet weak var SelectApplianceDatatxt: UITextField!
    
    //DAYS
    
    var WeakDataArray = [String]()
    var WeakArrayAddData = [String]()
    var evday:Int!
    var mnday:Int!
    func ClearData()
    {
        Scheduletextfield.text = ""
        SelectRoomDatatxt.text = ""
        SelectApplianceDatatxt.text = ""
        Timeselectlbl.text = ""
        Timeselectlbl.isHidden = true
        if mnday == 22
        {
            Monday.backgroundColor = UIColor.white
            Tuesday.backgroundColor = UIColor.white
            Wednesday.backgroundColor = UIColor.white
            Thursday.backgroundColor = UIColor.white
            Friday.backgroundColor = UIColor.white
            Saturday.backgroundColor = UIColor.white
            Sunday.backgroundColor = UIColor.white
        }
        else if evday == 11
        {
            Everyday.backgroundColor = UIColor.white
        }
    }
    @IBOutlet weak var Everyday: UIButton!
    @IBOutlet weak var Monday: UIButton!
    @IBOutlet weak var Tuesday: UIButton!
    @IBOutlet weak var Wednesday: UIButton!
    @IBOutlet weak var Thursday: UIButton!
    @IBOutlet weak var Friday: UIButton!
    @IBOutlet weak var Saturday: UIButton!
    @IBOutlet weak var Sunday: UIButton!
    @IBOutlet weak var Submit: UIButton!
    @IBAction func EverydayClick(_ sender: UIButton) {
        
        let evrdy = "Everyday"
        if Everyday.backgroundColor == UIColor.white
        {
            Everyday.backgroundColor = UIColor.green
            Monday.backgroundColor = UIColor.green
            Tuesday.backgroundColor = UIColor.green
            Wednesday.backgroundColor = UIColor.green
            Thursday.backgroundColor = UIColor.green
            Friday.backgroundColor = UIColor.green
            Saturday.backgroundColor = UIColor.green
            Sunday.backgroundColor = UIColor.green
            WeakDataArray.append(evrdy)
            evday = 11
        }
        else if Everyday.backgroundColor == UIColor.green
        {
            Everyday.backgroundColor = UIColor.white
            Monday.backgroundColor = UIColor.white
            Tuesday.backgroundColor = UIColor.white
            Wednesday.backgroundColor = UIColor.white
            Thursday.backgroundColor = UIColor.white
            Friday.backgroundColor = UIColor.white
            Saturday.backgroundColor = UIColor.white
            Sunday.backgroundColor = UIColor.white
        }
    }
    
  @IBAction func MondayClick(_ sender: UIButton)
    {
        let mon = "Monday"
     if Monday.backgroundColor == UIColor.white
     {
        Monday.backgroundColor = UIColor.green
        WeakArrayAddData.append(mon)
        mnday = 22
    }
    else if Monday.backgroundColor == UIColor.green
     {
            Monday.backgroundColor = UIColor.white
        let i = WeakArrayAddData.index(of: mon)
        WeakArrayAddData.remove(at: i!)
    }
       
    }
   @IBAction func TuesdayClick(_ sender: UIButton)
   {
    
    let tue = "Tuesday"
    if Tuesday.backgroundColor == UIColor.white
    {
       Tuesday.backgroundColor  = UIColor.green
        WeakArrayAddData.append(tue)
         mnday = 22
    }
    else if Tuesday.backgroundColor == UIColor.green
    {
        Tuesday.backgroundColor = UIColor.white
        let i = WeakArrayAddData.index(of: tue)
        WeakArrayAddData.remove(at: i!)
    }
    }
    @IBAction func WednesdayClick(_ sender: UIButton)
    {
        let wed = "Wednesday"
        if Wednesday.backgroundColor == UIColor.white
        {
           Wednesday.backgroundColor = UIColor.green
            WeakArrayAddData.append(wed)
             mnday = 22
        }
        else if Wednesday.backgroundColor == UIColor.green
        {
        Wednesday.backgroundColor  = UIColor.white
            let i = WeakArrayAddData.index(of: wed)
            WeakArrayAddData.remove(at: i!)
        }
    }
        
    @IBAction func ThursdayClick(_ sender: UIButton)
    {
        let thur = "Thursday"
        if Thursday.backgroundColor == UIColor.white
        {
            Thursday.backgroundColor = UIColor.green
            WeakArrayAddData.append(thur)
             mnday = 22
        }
        else if Thursday.backgroundColor == UIColor.green
        {
            Thursday.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: thur)
            WeakArrayAddData.remove(at: i!)
        }
      
    }
    @IBAction func FridayClick(_ sender: UIButton)
    {
        let fri = "Friday"
        if Friday.backgroundColor == UIColor.white
        {
            Friday.backgroundColor = UIColor.green
            WeakArrayAddData.append(fri)
             mnday = 22
        }
        else if Friday.backgroundColor == UIColor.green
        {
            Friday.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: fri)
            WeakArrayAddData.remove(at: i!)
        }
        
    }
    @IBAction func SaturdayClick(_ sender: UIButton)
    {
        let sat = "Saturday"
        if Saturday.backgroundColor == UIColor.white
        {
            Saturday.backgroundColor = UIColor.green
             WeakArrayAddData.append(sat)
             mnday = 22
        }
        else if Saturday.backgroundColor == UIColor.green
        {
       Saturday.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: sat)
            WeakArrayAddData.remove(at: i!)
    }
    }
    
    @IBAction func SundayClick(_ sender: UIButton)
    {
        let sun  = "Sunday"
        if Sunday.backgroundColor == UIColor.white
        {
            Sunday.backgroundColor = UIColor.green
            WeakDataArray.append(sun)
             mnday = 22
        }
        else if Sunday.backgroundColor == UIColor.green
        {
            Sunday.backgroundColor = UIColor.white
            let i = WeakArrayAddData.index(of: sun)
            WeakArrayAddData.remove(at: i!)
        }
    }
    
    @IBAction func SubmitClick(_ sender: UIButton)
    {
     
        if mnday == 22
        {
            let joined = WeakArrayAddData.joined(separator: ",")
            print(joined)
            let insert = "insert into Schedule(Schedule_Name , Room_Name , Appliance_Name ,Time ,Day)values('\(Scheduletextfield.text!)','\(SelectRoomDatatxt.text!)','\(SelectApplianceDatatxt.text!)','\(Timeselectlbl.text!)','\(joined)')"
            let isSuccess = DBWrapper.sharedObj.executeQuery(query: insert)
            if isSuccess
            {
                print("Insert: Success......")
                ClearData()
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
            
            let joined1 = WeakArrayAddData.joined(separator: ",")
            print(joined1)
            let insert = "insert into Schedule(Schedule_Name , Room_Name , Appliance_Name ,Time ,Day)values('\(Scheduletextfield.text!)','\(SelectRoomDatatxt.text!)','\(SelectApplianceDatatxt.text!)','\(Timeselectlbl.text!)','\(joined1)')"
            let isSuccess = DBWrapper.sharedObj.executeQuery(query: insert)
            if isSuccess
            {
                print("Insert: Success......")
                ClearData()
            }
            else
            {
                print("Failed")
            }

        }
    }
    
    
    
    
    //DAYSEND
    
    
    //TIME
    @IBOutlet weak var Timeselectlbl: UILabel!
    @IBOutlet weak var Timeviewoutlet: UIDatePicker!
    @IBAction func timeviewpickerdata(_ sender: UIDatePicker)
    {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        let currentTime = timeFormatter.string(from: Timeviewoutlet.date)
        Timeselectlbl.text = currentTime
        Timeviewoutlet.isHidden = true
    }
   // @IBOutlet weak var SelectApplianceoutletbtn: UIButton!
    @IBAction func Selectdataappliance(_ sender: UIButton)
    {
        if PickerViewAppliance.isHidden == true
        {
            PickerViewAppliance.isHidden = false
        }
        else
        {
            PickerViewAppliance.isHidden = true
        }
    }
    
    
    //PICKERVIEW
    @IBOutlet weak var PickerViewAppliance: UIPickerView!
    
    
    //SELECTROOM
  //  @IBOutlet weak var Selectoutletbtn: UIButton!

    var RoomArrayData = [String]()
    var ApplianceDataArray = [String]()
    //@IBOutlet weak var Roomdataoutllettbtn: UIButton!
    @IBOutlet weak var Roomtableview: UITableView!
    @IBAction func SelectRoomdata(_ sender: UIButton) {
       if Roomtableview.isHidden == true
        {
            Roomtableview.isHidden = false
        }
        else
        {
            Roomtableview.isHidden = true
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
 evday = 0
        mnday = 0
        // Do any additional setup after loading the view.
    
        //Room
        
        RoomArrayData = ["Bedroom","Living Room","Dining Room","Kitchen"]
        Roomtableview.delegate = self
        Roomtableview.dataSource = self
        Roomtableview.isHidden = true
        //Roomdataoutllettbtn.layer.cornerRadius = 20
       // Roomdataoutllettbtn.layer.borderWidth = 1
        
        //Appliance
        
        ApplianceDataArray = ["Light1","Light2","Light3","Fan","AC","TV"]
        PickerViewAppliance.delegate = self
        PickerViewAppliance.dataSource = self
    PickerViewAppliance.isHidden = true
       //Selectoutletbtn.layer.cornerRadius = 20
        //Selectoutletbtn.layer.borderWidth = 1
    // SelectApplianceoutletbtn.layer.cornerRadius = 20
      //  SelectApplianceoutletbtn.layer.borderWidth = 1
        
        //Days
        
        Submit.layer.cornerRadius = 20
      Monday.layer.cornerRadius = 15
        Tuesday.layer.cornerRadius = 15
       Wednesday.layer.cornerRadius = 15
       Thursday.layer.cornerRadius = 15
       Friday.layer.cornerRadius = 15
        Saturday.layer.cornerRadius = 15
       Sunday.layer.cornerRadius = 15
        
          Submit.layer.borderWidth = 1
        Monday.layer.borderWidth = 1
         Tuesday.layer.borderWidth = 1
        Wednesday.layer.borderWidth = 1
        Thursday.layer.borderWidth = 1
         Friday.layer.borderWidth = 1
         Saturday.layer.borderWidth = 1
        Sunday.layer.borderWidth = 1
        Monday.backgroundColor = UIColor.white
         Tuesday.backgroundColor = UIColor.white
         Wednesday.backgroundColor = UIColor.white
         Thursday.backgroundColor = UIColor.white
         Friday.backgroundColor = UIColor.white
         Saturday.backgroundColor = UIColor.white
         Sunday.backgroundColor = UIColor.white
         Everyday.backgroundColor = UIColor.white
        
        
      
    }
    
    //TABLEVIEWFUNTIONS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return RoomArrayData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
     let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = RoomArrayData[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
       SelectRoomDatatxt.text = cell!.textLabel!.text!
        Roomtableview.isHidden  = true
    }
    //TABLEVIEW END
    
    
    //PICKERVIEWFUNCTIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return ApplianceDataArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        let title = ApplianceDataArray[row]
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
      SelectApplianceDatatxt.text = ApplianceDataArray[row]
    }

    //PICKERVIEW END
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

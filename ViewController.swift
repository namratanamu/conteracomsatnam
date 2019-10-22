//
//  ViewController.swift
//  Conterramchnetest
//
//  Created by Felix 05 on 11/08/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
 
  
    
    var Schedulearray = [String]()
    var Arrayday = [String]()
    var Arraytime = [String]()
    

    @IBOutlet weak var adnwschedule: UIButton!
    @IBOutlet weak var Collectionview: UICollectionView!
    @IBAction func Addnewschedule(_ sender: UIButton)
    {
        let screentwo = self.storyboard?.instantiateViewController(withIdentifier: "ScreenTwoViewController") as! ScreenTwoViewController
        
        navigationController?.pushViewController(screentwo, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        let update = self.storyboard?.instantiateViewController(withIdentifier: "UpdateViewController") as! UpdateViewController
        update.sname = cell.ScheduleName.text!
        
        navigationController?.pushViewController(update, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return Schedulearray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    cell.ScheduleName.text = Schedulearray[indexPath.row]
        cell.Timelbl.text = Arraytime[indexPath.row]
        cell.Daylbl.text = Arrayday[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func viewWillAppear(_ animated: Bool)
    {
        let select = "select * from Schedule "
        DBWrapper.sharedObj.slectALLTask(query: select)
        if DBWrapper.sharedObj.scheduleArrayData.count > 0 && DBWrapper.sharedObj.DayScheduleArray.count > 0 &&
            DBWrapper.sharedObj.TimeScheduleArray.count > 0
        {
            Schedulearray = DBWrapper.sharedObj.scheduleArrayData
            Arrayday = DBWrapper.sharedObj.DayScheduleArray
            Arraytime = DBWrapper.sharedObj.TimeScheduleArray
        }
        else
        {
            print("Not found")
        }
        
        self.Collectionview.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    adnwschedule.layer.cornerRadius = 20
        adnwschedule.layer.borderWidth = 1
        
       // ScheduleNamlbl.layer.cornerRadius = 15
        //ScheduleNamlbl.layer.borderWidth = 1
        
        Collectionview.delegate = self
        Collectionview.dataSource = self
        
        let select = "select * from Schedule "
        DBWrapper.sharedObj.slectALLTask(query: select)
        if DBWrapper.sharedObj.scheduleArrayData.count > 0 && DBWrapper.sharedObj.DayScheduleArray.count > 0 &&
            DBWrapper.sharedObj.TimeScheduleArray.count > 0
        {
           Schedulearray = DBWrapper.sharedObj.scheduleArrayData
            Arrayday = DBWrapper.sharedObj.DayScheduleArray
            Arraytime = DBWrapper.sharedObj.TimeScheduleArray
        }
        else
        {
            print("Not found")
        }
        
       
       // adnwschedule.layer.borderColor = UIColor.blue.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


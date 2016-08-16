//
//  ViewController.swift
//  MiraclePill
//
//  Created by Clay Tsuhako on 8/15/16.
//  Copyright © 2016 Clay Tsuhako. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // Above, implementing two protocols (UIPickerViewDataSource and UIPickerViewDelegate) which tells the data sources (statePicker.dataSource = self and statePicker.delegate = self) that the statePicker in the View should talk to this View Controller whenever it needs a Title, Number of Rows, was a Row selected, etc. and that the View Controller will handle that job.
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryTxt: UITextField!
    @IBOutlet weak var zipLbl: UILabel!
    @IBOutlet weak var zipTxt: UITextField!
    
    let states = ["Arkansas","Illinois", "Florida", "California","Maine","New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        // statePicker.delegate acts on behalf of the statePicker and handles the things that the statePicker wants to do.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: AnyObject) {
        statePicker.isHidden = false
        countryLbl.isHidden = true
        countryTxt.isHidden = true
        zipLbl.isHidden = true
        zipTxt.isHidden = true

        // Shows statePicker when statePickerBtn is pressed.
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState()) //Should be UIControlState.normal
        statePicker.isHidden = true
        countryLbl.isHidden = false
        countryTxt.isHidden = false
        zipLbl.isHidden = false
        zipTxt.isHidden = false
        // When state is selected, statePickerBtn is hidden and title is set on the statePicker Btn.
    }

    
}


//
//  ViewController.swift
//  compoundInterest_bmiles
//
//  Created by Benjamin Miles on 11/19/17.
//  Copyright © 2017 Benjamin Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var principalAmount: Double = 0.0
    var interestRatePct: Double = 0.0
    var resultsValue: Double = 0.0
    var numberOfYears: Int = 0
    var timesPerYear: Int = 0
    var showResult: Bool = false
    var outputString: String = ""
    var invalidFields: [String] = [String]()
    
    @IBOutlet weak var principalTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var numYearsTextField: UITextField!
    @IBOutlet weak var timesPerYearTextField: UITextField!
    @IBOutlet weak var calcInterestButton: UIButton!
    @IBOutlet weak var resultsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTextView.text = outputString
        calcInterestButton.layer.borderColor = UIColor.blue.cgColor
        resultsTextView.layer.borderColor = UIColor.lightGray.cgColor
        principalTextField.keyboardType = UIKeyboardType.decimalPad
        rateTextField.keyboardType = UIKeyboardType.decimalPad
        timesPerYearTextField.keyboardType = UIKeyboardType.decimalPad
        numYearsTextField.keyboardType = UIKeyboardType.decimalPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calcInterestButton(_ sender: Any) {

        let validator: Validator = Validator()

        // Validate Principal Amount
        
        if !validator.isEmptyField(textValue: principalTextField.text!) {
            
            if validator.checkDecimalNumber(numberString: principalTextField.text!) > 0 {
             
                self.principalAmount = validator.checkDecimalNumber(numberString: principalTextField.text!)
                
            } else {
                invalidFields.append("\(principalTextField.text!) is not a valid decimal number! Please enter a valid Principal Amount!")
                principalTextField.text = ""
                principalTextField.becomeFirstResponder()
            }
            
        } else {
            invalidFields.append("Please enter a value for Principal Amount!")
            principalTextField.becomeFirstResponder()
        }

        //Validate Interest Rate Pct
        
        if !validator.isEmptyField(textValue: rateTextField.text!) {
            
            if validator.checkDecimalNumber(numberString: rateTextField.text!) > 0 {
                
                self.interestRatePct = validator.checkDecimalNumber(numberString: rateTextField.text!)
                
            } else {
                invalidFields.append("\(rateTextField.text!) is not a valid decimal number! Please enter a valid Interest Rate Pct!")
                rateTextField.text = ""
                rateTextField.becomeFirstResponder()
            }
            
        } else {
            invalidFields.append("Please enter a value for Interest Rate Pct!")
            rateTextField.becomeFirstResponder()
        }
        
        //Validate Number of Years
        
        if !validator.isEmptyField(textValue: numYearsTextField.text!) {
            
            if validator.checkInteger(integerString: numYearsTextField.text!) > 0 {
                
                self.numberOfYears = validator.checkInteger(integerString: numYearsTextField.text!)
                
            } else {
                invalidFields.append("\(numYearsTextField.text!) is not a valid integer! Please enter a valid Number of Years!")
                numYearsTextField.text = ""
                numYearsTextField.becomeFirstResponder()
            }
            
        } else {
            invalidFields.append("Please enter a value for Number of Years!")
            numYearsTextField.becomeFirstResponder()
        }
        
        //Validate Times per Year
        
        if !validator.isEmptyField(textValue: timesPerYearTextField.text!) {
            
            if validator.checkInteger(integerString: timesPerYearTextField.text!) > 0 {
                
                self.timesPerYear = validator.checkInteger(integerString: timesPerYearTextField.text!)
                
            } else {
                invalidFields.append("\(timesPerYearTextField.text!) is not a valid integer! Please enter a valid Times per Year!")
                timesPerYearTextField.text = ""
                timesPerYearTextField.becomeFirstResponder()
            }
            
        } else {
            invalidFields.append("Please enter a value for Times per Year!")
            timesPerYearTextField.becomeFirstResponder()
        }
        
        if invalidFields.count > 0 {
            
            resultsTextView.text = ""
            
            for invalidField in invalidFields {
                outputString += "\(invalidField)\n"
            }
            
            resultsTextView.text = outputString
            resetValues()
            
        } else { showResult = true }
        
        if showResult {
            
            let calculator: CompoundInterestHelper = CompoundInterestHelper()
            let formatter: NumberFormatter = NumberFormatter()
            formatter.groupingSeparator = ","
            formatter.numberStyle = .currency
            
            resultsValue  = calculator.compoundInterest(principalAmount, interestRatePct, numberOfYears, timesPerYear)
            
            let formatedResultsValue: String = formatter.string(from: NSNumber(value: (Double(resultsValue))))!
            let formatedPrincipalAmount: String = formatter.string(from: NSNumber(value: (Double(principalAmount))))!

            let formatedInterestRatePct: String = String(format: "%.01f%%", interestRatePct)
            outputString = "\(formatedPrincipalAmount) invested at \(formatedInterestRatePct) for \(numberOfYears) years compounded \(timesPerYear) times per year is \(formatedResultsValue)."
            
            resultsTextView.text = outputString
            refreshUI()
            resetValues()
        }
        
    }
    
    func resetValues() -> Void {
        
        self.outputString = ""
        self.principalAmount = 0.0
        self.interestRatePct = 0.0
        self.resultsValue = 0.0
        self.numberOfYears = 0
        self.timesPerYear = 0
        self.showResult = false
        self.invalidFields.removeAll()
        
    }
    
    func refreshUI() -> Void {
        
        principalTextField.text = ""
        rateTextField.text = ""
        numYearsTextField.text = ""
        timesPerYearTextField.text = ""
        self.outputString = ""
        self.showResult = false
        refreshUIKeyboards()
        
    }
    
    func refreshUIKeyboards() -> Void {
        
        principalTextField.resignFirstResponder()
        rateTextField.resignFirstResponder()
        numYearsTextField.resignFirstResponder()
        timesPerYearTextField.resignFirstResponder()
        
    }
    


}

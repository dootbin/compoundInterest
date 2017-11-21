//
//  Validator.swift
//  compoundInterest_bmiles
//
//  Created by Benjamin Miles on 11/19/17.
//  Copyright © 2017 Benjamin Miles. All rights reserved.
//

import UIKit

class Validator: NSObject {
    
    func isEmptyField(textValue: String) -> Bool {
        
        if textValue.isEmpty {
           
            return true
        
        } else {
            
            return false
       
        }

    }
    
    func checkInteger(integerString: String) -> Int {
        
        guard let validInt = Int(integerString) else {
            
            return 0
            
        }
        
        return validInt
        
    }

    func checkDecimalNumber(numberString: String) -> Double {
        
        guard let validDouble = Double(numberString) else {
            
            return 0.0
            
        }
        
            return validDouble
        
    }

}

//
//  CompoundInterestHelper.swift
//  compoundInterest_bmiles
//
//  Created by Benjamin Miles on 11/19/17.
//  Copyright © 2017 Benjamin Miles. All rights reserved.
//

import UIKit

class CompoundInterestHelper: NSObject {
    
    func compoundInterest(_ principal: Double,_ ratePct: Double,_ numberOfYears: Int,_ timesPerYear: Int) -> Double {
        
        // Compound Interest formula per instructions: Result = P(1 + r/n)^nt
        let resultValue: Double = principal * pow((1 + ((ratePct/100)/Double(timesPerYear))),Double(numberOfYears*timesPerYear))
        
        return resultValue
    }
    
}

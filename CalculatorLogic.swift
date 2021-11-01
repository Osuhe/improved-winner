//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Angela Yu on 18/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    var numberX: Double!
    var numberY: Double!
     var result: Double!
     var symbol: String? = " "
    
    
    
    func setNumber(number: Double) {
        if numberX == nil{
            numberX = number
        }else {
            numberY = number
        }
       
    }
    
        func resultTotal (oper: String) -> Double?{
        if let oper = symbol {
            switch oper {
                        case "+":
                            return numberX + numberY
                        case "-":
                            return numberX - numberY
                        case "×":
                            return numberX * numberY
                        case "÷":
                            return numberX / numberY
                        default:
                            fatalError("The operation passed in does not match any of the cases.")
                        }
                    }
                    return nil
                }
    


    
    
    public func reset()-> Double {
        symbol = " "
        numberX = nil
        numberY = nil
        result = 0
        return result

        
    }



}
            
        
        
        
        
    


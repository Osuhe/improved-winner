//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

@available(iOS 15.0, *)
@available(iOS 15.0, *)
class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var toggleMultiSymbol = false
    private var iqualOn = true
    private var dotButton = true
    private var dotButtonCal = false
    private var dotButtonNum = false
    private var percentageOn = true
    private var displayValue: Double {
        get {
            
            guard let number = Double(displayLabel.text!)
            
            else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
           
            displayLabel.text = newValue.formatted()
            
           
            
                
            }
          
        }
    
    
    
    private var calculator = CalculatorLogic()
    
    
    @IBAction func percetButtonPressed(_ sender: UIButton) {
        if displayLabel.text! == "0" {}
       
        else if calculator.numberX != nil && iqualOn == false  {
            displayLabel.text = String(displayValue / 100)
            calculator.numberX =  displayValue } else if calculator.numberX == nil   {
            displayLabel.text = String(displayValue / 100)
            }else if calculator.symbol != nil && calculator.numberY == nil  {
                if calculator.symbol == "+" || calculator.symbol == "-" {
                    displayLabel.text = String((displayValue / 100) * calculator.numberX)
                    
                } else { displayLabel.text = String((displayValue / 100))
                    
                }

            }
    
    }
        
    
    @IBOutlet weak var eraseButton: UIButton!
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        var dotPresent : Bool = false
        if displayLabel.text!.contains(".") || displayLabel.text!.contains("e") == true {
            dotPresent = true
        
        }
        if dotPresent == false && displayLabel.text == "0" {
            displayLabel.text!.append(".")
            isFinishedTypingNumber = false
          dotPresent = true
          }
        
        
        
        if dotPresent == false  { if dotButton == false {
        } else {
            displayLabel.text?.append(".")
            dotPresent = true
        }
        }
        
        if  dotButtonCal == true && dotButtonNum == false {
            displayLabel.text = "0."
            isFinishedTypingNumber = false
        }
        
   }
    
    
    
    
    
    @IBAction func acButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if sender.currentTitle == "AC"{
            displayLabel.text = String(calculator.reset())
            iqualOn = true
           
            
          
        }
            
        
            if sender.currentTitle == "C" {
                       eraseButton.setTitle("AC", for: .normal)
                if calculator.symbol != " " && iqualOn == false {
                    displayLabel.text! = "0"
                   }
                else if calculator.symbol != " " && toggleMultiSymbol == true{
                    displayLabel.text! = "0"
                } else if calculator.symbol != " " {
                    calculator.symbol = " "
                    calculator.numberX = nil
                    displayLabel.text! = "0"
                    
                } else if calculator.symbol == " " {
                    displayLabel.text! = "0"
                    calculator.numberX = nil
                }
                }
               
               
    }

        
    
    
    


    @IBAction func pNBbuttonPressed(_ sender: UIButton) {
        if displayLabel.text! != "0" &&  displayLabel.text! != "0." {
       
            
            if displayLabel.text!.starts(with: "-") {
                    displayLabel.text!.removeFirst()
                } else {
                    displayLabel.text?.insert("-", at: displayLabel.text!.startIndex)
                }
            if iqualOn == false && calculator.symbol != " " && calculator.numberY != nil  {
                calculator.numberX = calculator.numberX * -1
                }

        
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        dotButton = false
        isFinishedTypingNumber = true
        dotButtonCal = true
        dotButtonNum = false
        
        
        if iqualOn == false && calculator.numberY != nil {
            calculator.numberY = nil
            iqualOn = true
            
        
        }
        
        
        if calculator.symbol != " "  && toggleMultiSymbol == false {
           calculator.symbol = sender.currentTitle
           
            
        }
        if calculator.symbol != " "  && toggleMultiSymbol == true  {
            
            calculator.setNumber(number: displayValue)
         
            
        }
        
        if calculator.symbol == " "  {
            calculator.symbol = sender.currentTitle
            calculator.setNumber(number: displayValue)
            toggleMultiSymbol = false
        }
        
        
        if calculator.symbol == " " && iqualOn == true  {
            
            calculator.setNumber(number: displayValue)
            calculator.symbol = sender.currentTitle!
        }
        
           else if  calculator.numberY != nil  {
            displayValue = calculator.resultTotal(oper: calculator.symbol!)!
            calculator.numberX = displayValue
            calculator.symbol = sender.currentTitle
            calculator.numberY = nil
            toggleMultiSymbol = false
            
    }
        else if calculator.symbol != " " && calculator.numberY == nil  {
        calculator.symbol = sender.currentTitle
            
        }
       
        
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
    
        isFinishedTypingNumber = true
        iqualOn = false
        dotButtonNum = false
        dotButtonCal = false
        
        if calculator.numberY == nil && calculator.symbol != " " {
            calculator.numberY = displayValue
           
        }
        
        if calculator.numberX != nil && calculator.symbol != " " && calculator.numberY != nil {
            
            displayValue = calculator.resultTotal(oper: calculator.symbol!)!
            calculator.numberX = displayValue
            toggleMultiSymbol = false
           }
   dotButton = false
    }
    
    
       @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        
        toggleMultiSymbol = true
        dotButton = true
        dotButtonNum = true
       
        eraseButton.setTitle("C", for: .normal)
       
        var numValue : String = " "
        
        numValue = sender.currentTitle!
        
            
        if isFinishedTypingNumber == true {
                
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {

                if displayLabel.text == "0" && sender.currentTitle == "0" {
                    displayLabel.text = sender.currentTitle


                }  else  if displayLabel.text!.count <= 8 { displayLabel.text = displayLabel.text! + numValue
                   
                }
                
                if displayLabel.text!.count > 1 && displayLabel.text!.prefix(1) == "0" && displayLabel.text!.prefix(2) != "0."   {
                    displayLabel.text! = String(displayLabel.text!.dropFirst(1))
               
                    }
               
            }
                
                
            
                
                
                }
                
  
    }
extension Double {
    func formatted() -> String {
    let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 3  // default is 3 decimals
    return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }

}




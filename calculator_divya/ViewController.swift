//
//  ViewController.swift
//  calculator_divya
//
//  Created by Canadore Student on 2023-03-22.
//



import UIKit

class ViewController: UIViewController {
    
    
    

    @IBOutlet weak var displayHistory: UILabel!
    @IBOutlet weak var displayResult: UILabel!
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearAll()
    }

    func clearAll()
        {
            workings = ""
            displayHistory.text = ""
            displayResult.text = ""
        }
    
    func addToWorkings(value:String)
        {

                workings = workings + value
                displayHistory.text = workings
        }
    
    @IBAction func equalnput(_ sender: Any) {
        if(validInput())
        {
                let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")

                let expression = NSExpression(format: checkedWorkingsForPercent)

                let result = expression.expressionValue(with: nil, context: nil) as! Double

                let resultString = formatResult(result: result)

                 displayResult.text = resultString
                
        }

        else
        {

                let alert = UIAlertController(
                title: "Invalid Input",
                message: "No result found!",
                preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true, completion: nil)
        }
    }
    
       
    
    func validInput()->Bool
        {
                var count = 0
                var funcCharIndexes = [Int]()
                for char in workings
                {
                    if(specialCharacter(char: char))
                    {
                        funcCharIndexes.append(count)
                    }
                        count += 1
                    
                }
                var previous: Int = -1
                for index in funcCharIndexes
                {
                    if(index == 0)
                    {
                        return false
                    }
                    if(index == workings.count - 1)
                    {
                        return false
                    }
                    if(previous != -1)
                    {
                        if(index - previous == 1)
                        {
                            return false
                        }
                    }

                        previous = index

                }
                    return true
        }
    
    func specialCharacter(char: Character)->Bool
        {

                if(char == "*"){

                    return true

                }

                if(char == "/"){

                    return true

                }

                if(char == "+"){

                    return true

                }

                if(char == "-"){

                    return true

                }

                return false
        }
    
    func formatResult(result: Double) -> String
        {
            return String(format: "%.2f", result)
        }
    
    
    @IBAction func plusInput(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func minusInput(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func multiplyInput(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func divideInput(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
      
    @IBAction func percentageInput(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func clearInput(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            displayHistory.text = workings
        }
        
    }
    
    @IBAction func backInput(_ sender: Any) {
        clearAll()
        
    }
    
    @IBAction func pointInput(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
     
    @IBAction func zeroInput(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneInput(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoInput(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeInput(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourInput(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func fiveInput(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func sixInput(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func sevenInput(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eightInput(_ sender: Any) {
        addToWorkings(value: "8")
    }
   
    @IBAction func nineInpu(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
       
       

}


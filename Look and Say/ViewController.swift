//
//  ViewController.swift
//  Look and Say
//
//  Created by user226698 on 10/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var EnteredValue: UITextField!
    
    
    @IBAction func LookAndSay() {
        let number = EnteredValue.text ?? ""
        let numberArray = number.utf8.map{Int($0)-48}
        if numberArray.count == 2 {
            
            var left_number:[Int] = [numberArray[0]]
            let right_number = numberArray[1]
        
            for i in 1...right_number{
             let stringifiedNumberList = left_number
                        .map { String($0) }
                        .joined(separator: "")
              print("Seq \(i): \(stringifiedNumberList)")
              left_number = calculateLookAndSay(left_number)
            }
            
        }else{
            
            let alert = UIAlertController(title: "Error!", message:"Please enter two digit number only", preferredStyle: .alert)
            let action = UIAlertAction(title: "Try Again", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
            
        }
    }
    
    private func calculateLookAndSay(_ seq: [Int]) -> [Int] {
        var result = [Int]()
        var cur = seq[0]
        var curRunLength = 1
          for i in seq.dropFirst() {
            if cur == i {
              curRunLength += 1
            } else {
              result.append(curRunLength)
              result.append(cur)
              curRunLength = 1
              cur = i
            }
          }

          result.append(curRunLength)
          result.append(cur)
        
        return result
    }
    
}


//
//  ViewController.swift
//  LearnTimer
//
//  Created by Raja Sinha on 7/29/18.
//  Copyright © 2018 Softechnocon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Define Closure here
    
    
    //Timer1
    var timer1 : UILabel = {
      let  label = UILabel()
//        label.text = "00:00"
         label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    //Timer2
    var timer2 : UILabel = {
        let  label = UILabel()
//        label.text = "00:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    var obj1 = Time_Calculation()
    var obj2 = Time_Calculation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
     self.setupLayout()
        
    //  timeStart()
        
       timer1.text = obj1.updateTime(10, timer1)
       timer2.text = obj2.updateTime(40, timer2)
        
        
//timer
    var timer = Timer()
        
    func timeStart(){
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(Time_Calculation.updateTime)), userInfo: nil, repeats: true)
        
    
        
        
    }
        
func setupLayout(){
            
        let firstView = UIView()
            
        firstView.backgroundColor = UIColor.gray
        view.addSubview(firstView)
            
            firstView.translatesAutoresizingMaskIntoConstraints = false
            firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            firstView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50).isActive = true
            
            
            firstView.addSubview(timer1)
            
            timer1.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 80).isActive = true
            timer1.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 30).isActive = true
            timer1.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -200).isActive = true
            timer1.heightAnchor.constraint(equalTo: firstView.heightAnchor, multiplier: 0.25).isActive = true
            timer1.backgroundColor = UIColor.yellow
            timer1.textAlignment = .center
            
            
            
            firstView.addSubview(timer2)
            
            timer2.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 80).isActive = true
            timer2.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 190).isActive = true
            timer2.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -40).isActive = true
            timer2.heightAnchor.constraint(equalTo: firstView.heightAnchor, multiplier: 0.25).isActive = true
            timer2.backgroundColor = UIColor.yellow
            timer2.textAlignment = .center
            
        }
    
}
    
    
    
class Time_Calculation{
    var a = Int()
    var b = Int()
    
    
    
    //Variable decleration
    
    var time = 0
    
    
    
    @objc func updateTime(_ sec: Int, _ lableName: UILabel) -> String {
        
        //    let label1 : UILabel = label
//        var b : Int
//        var a : Int
        
        var time = sec
        let lable = lableName
        
        time += 1
        
        a = time % 60 //Seconds
        b = time / 60 //Minutes
        
        if b > 59 {
            b = 0
        }
        
     //   timer1.text = "\(b)  :  \(a)"
        
        print(a, b)
       // colorChange(a: a, b: b)
        lable.text = "\(b)  :  \(a)"
        let lblTxt = lable.text
        
        return lblTxt!
        
    }
    
    
    
    }
    
    //Color Change Function for the Vechniles in the queue
    
//    func colorChange(a:Int, b:Int) {
//
//        if (b>=2 && b<4) {
//            timer1.backgroundColor = UIColor.blue
//            timer2.backgroundColor = UIColor.blue
//        }
//
//        else if b>=4 {
//            timer1.backgroundColor = UIColor.red
//            timer2.backgroundColor = UIColor.red
//        }
//    }
    
    
    
    
}

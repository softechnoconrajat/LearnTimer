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
    
    
    
var obj1 = abc()
var obj2 = abc()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
     self.setupLayout()
    
        
        
    obj1.startTimer(timer1, 15,1)
        
    obj2.startTimer(timer2, 70, 2)
        
//
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


class abc {
    
    var labelName : UILabel = UILabel()
    
    var timer = Timer()
    
    var time = 0
    
    var status = 0
    
    func startTimer(_ label : UILabel, _ vechTime: Int, _ Vechstatus: Int){
        
        labelName = label
        
        time = vechTime
        
        status = Vechstatus
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(abc.action), userInfo: nil, repeats: true)
    }
    
    @objc func action(){
        
        let label = labelName
        
        time += 1
        
        let  a = time % 60 //Seconds
        var  b = time / 60 //Minutes
        
        if b > 59 {
            b = 0
        }
        
        //   timer1.text = "\(b)  :  \(a)"
        
        // print(a, b)
        // colorChange(a: a, b: b)
        
        DispatchQueue.main.async {
            label.text =  "\(b)  :  \(a)"
        }
        
        colorChange(a, b, label, status)
        
    }
    
    func colorChange(_ a:Int, _ b:Int, _ label:UILabel, _ status:Int) {
        
        let a : Int = a
        let b : Int = b
        let label :UILabel = label
        let status: Int = status
        
        DispatchQueue.main.async {
            
            if status == 1{
                if ( b == 0 && a < 45) {
                    label.backgroundColor = UIColor.green
                }
                else if (b == 0 && a > 45) || (b == 0 && a < 59) {
                    label.backgroundColor = UIColor.yellow
                }
                else if b>0 {
                    label.backgroundColor = UIColor.red
                }
                
                
            }//end of status == 1
                
            else if status == 2{
                
                if (b <= 1 && a < 60) || (b == 2 && a < 30) {
                    label.backgroundColor = UIColor.green
                }
                else if (b == 2 && a > 30) || (b == 2 && a < 59) {
                    label.backgroundColor = UIColor.yellow
                }
                else {
                    label.backgroundColor = UIColor.red
                }
            } //end os status == 2
        }
        
        
    } // End of colour change function
    
    
    
}
    

    
    



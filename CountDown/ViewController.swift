//
//  ViewController.swift
//  CountDown
//
//  Created by Rodrigo Hernández Gómez on 02/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    let COUNTDOWN = 3
    var running = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        displayLabel.text = String(COUNTDOWN)
        
    }
    
    
    @IBAction func startStop(_ sender: UIButton) {
        
        if(running){
            sender.titleLabel?.text = "START"
            running = false
            stopCount()
        }else{
            sender.titleLabel?.text = "STOP"
            running = true
            DispatchQueue.global().async {
                self.startCount()
            }
        }
        
        
    }
    		
    //This function
    func startCount(){
        
        //Con cada segundo que pase
        //If count == 0 Alert
        var countDown = COUNTDOWN
        
        while(countDown >= 0 && running){
            DispatchQueue.main.async {
                //self.displayLabel.text = String(countDown)
                self.updateDisplay(newValue: String(countDown))
            }
            sleep(1)
            countDown -= 1
        }
        
        displayLabel.text = String(0)
        
        //TODO show the alert
        if(countDown < 0){
            
            DispatchQueue.main.async {
                self.stopCount()
            }
 
        }
    
    }
    
    //This function stop the countwond
    func stopCount(){
        
        let alert = UIAlertController.init(title: "BOOM!", message: "Acabó la cuenta atrás", preferredStyle: .alert)
         
         alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
         self.present(alert, animated: true, completion: nil)
         
         restartCountDown()
        
        if(running){
            running = false
        }
        
    }
    
    func updateDisplay(newValue: String){
        
        displayLabel.text = newValue
        
    }
    
    //This function restart the timer
    func restartCountDown(){
        
        displayLabel.text = String(COUNTDOWN)
        running = false
        
    }


}


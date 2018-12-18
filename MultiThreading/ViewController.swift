//
//  ViewController.swift
//  MultiThreading
//
//  Created by liguiyang on 2018/12/12.
//  Copyright © 2018年 liguiyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.timerLabel.text = "\(self.count)"
//            print("timer thread:\(Thread.current)")
        }.fire()
    }
    @IBAction func caculate(_ sender: Any) {
        var sum = 0
        for _ in 1...100 {
            DispatchQueue.global().async {
                print("Run thread:\(Thread.current)")
                
                for i in 1...1000 {
                    usleep(10000)
                    sum += i
                }
                DispatchQueue.main.async {
                    self.testLabel.text = "sum:\(sum)"
                }
            }
        }
        
    }
    

}


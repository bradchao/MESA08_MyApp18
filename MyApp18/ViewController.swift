//
//  ViewController.swift
//  MyApp18
//
//  Created by user22 on 2017/9/26.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let plist = NSHomeDirectory() + "/Documents/appdata.plist"

    @IBOutlet weak var labelUsername: UILabel!
    @IBAction func changePList(_ sender: Any) {
        let data = NSMutableDictionary(contentsOfFile: plist)
        
        data!["username"] = "Brad"
        
        //atomically:true => 暫存檔; false: 立即
        if (data?.write(toFile: plist, atomically: false))! {
            print("change OK")
        }else{
            print("change XX")
        }
    }

    func addData(){
        let data = NSMutableDictionary(contentsOfFile: plist)
        
        data!["data"] = "iii"
        
        if (data?.write(toFile: plist, atomically: true))! {
            print("change OK")
        }else{
            print("change XX")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(NSHomeDirectory())
        
        let data = NSMutableDictionary(contentsOfFile: plist)
        print("UserName: \(data!["username"]!)")
        print("Stage: \(data!["stage"]!)")

        labelUsername.text = data!["username"] as! String
        
        addData()
        
        
        
    }

}


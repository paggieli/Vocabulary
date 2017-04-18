//
//  AtoZViewController.swift
//  032817vocabulary
//
//  Created by Admin on 2017/3/28.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

class AtoZViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //forResource is file name; ofType is extention namel
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let controller = segue.destination as! EngViewController
        controller.alphabet = segue.identifier!
        
    }
    

}

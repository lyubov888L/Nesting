//
//  ViewController.swift
//  Example
//
//  Created by ShevaKuilin on 2019/5/20.
//  Copyright © 2019 Warpdrives Team. All rights reserved.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.ne_creatContainerScrollView(5) // Test: Creat scrollView
        //self.ne_backgroundColor = UIColor.red;
        
    }
}

class NEContainerScrollView: UIScrollView {
    func ne_creatNestedViewController(_ childControllerCount: Int){

    }
}

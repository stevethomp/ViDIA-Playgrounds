//
//  ViewController.swift
//  ImportantWorkProject
//
//  Created by Steven Thompson on 2017-02-08.
//  Copyright © 2017 stevethomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        print(Formatter.displayDate(fromDate: Date()))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


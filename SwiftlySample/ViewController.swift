//
//  ViewController.swift
//  SwiftlySample
//
//  Created by HayashidaKazumi on 2016/04/23.
//  Copyright © 2016年 HayashidaKazumi. All rights reserved.
//

import UIKit
import Swiftly

class ViewController: UIViewController {
  let tableView = UITableView(frame: CGRectZero, style: .Plain)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView.backgroundColor = .redColor()
    view.addSubview(tableView)
  }
  
  override func viewWillLayoutSubviews() {
    print("self.view.fame \(view.frame)")
    
    tableView.applyLayout(.Horizontal(), .Vertical())
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


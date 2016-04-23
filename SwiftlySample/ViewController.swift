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
  var tableConstraints = [NSLayoutConstraint]()
  var twoColumnConstraints = [NSLayoutConstraint]()

  let tableView = UITableView(frame: CGRectZero, style: .Plain)
  let propertyView = UIView(frame: CGRectZero)
  let button = UIButton(type: .Custom)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    tableView.backgroundColor = .redColor()
    view.addSubview(tableView)

    propertyView.backgroundColor = .blueColor()
    view.addSubview(propertyView)
    
    button.titleLabel?.text = "Change Layout"
    button.backgroundColor = .greenColor()
    button.addTarget(self, action: #selector(ViewController.changeLayout), forControlEvents: .TouchUpInside)
    view.addSubview(button)
  }
  
  override func viewWillLayoutSubviews() {
    print("self.view.fame \(view.frame)")
    
    if twoColumnConstraints.isEmpty {
      twoColumnConstraints += tableView.applyLayout(.Vertical(), .Height() / 2)
      twoColumnConstraints += propertyView.applyLayout(.Vertical() / 2, .Height() / 2)
      NSLayoutConstraint.deactivateConstraints(twoColumnConstraints)
    }
    
    if tableConstraints.isEmpty {
      button.applyLayout(.Horizontal(), .Height() == 60, .Bottom() == .Bottom(view))
      tableConstraints += tableView.applyLayout(.Horizontal(), .Vertical() - button.frame.height)
      tableConstraints += propertyView.applyLayout(.Horizontal(), .Top() == .Bottom(tableView))
    }
    
    NSLayoutConstraint.activateConstraints(tableConstraints)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func changeLayout() {
    print("Change Layout")
    NSLayoutConstraint.deactivateConstraints(tableConstraints)
    NSLayoutConstraint.activateConstraints(twoColumnConstraints)
    view.layoutIfNeeded()
  }
}


//
//  ViewController.swift
//  SwiftSome
//
//  Created by 刘依男 on 2019/6/29.
//  Copyright © 2019 刘依男. All rights reserved.
//

import UIKit

class ViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
//        var one = OneViewController()
        let one = UINavigationController(rootViewController: OneViewController())
        one.tabBarItem = UITabBarItem(title: "One", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        
        let two = UINavigationController(rootViewController: TwoViewController())
        two.tabBarItem = UITabBarItem(title: "Two", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        
        let three = UINavigationController(rootViewController: ThreeViewController())
        three.tabBarItem = UITabBarItem(title: "Three", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        self.viewControllers = [one,two,three]
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}


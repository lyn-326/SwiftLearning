//
//  OneViewController.swift
//  SwiftSome
//
//  Created by 刘依男 on 2019/6/29.
//  Copyright © 2019 刘依男. All rights reserved.
//

import UIKit

class OneViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource {
    var Arr:[String] = ["跳转到下一页","111","222"]
    
    //MARK:视图将要展示
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:标题
        self.navigationItem.title = "One"
        //MARK:创建表格
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        //设置代理
        tableView.delegate = self;
        tableView.dataSource = self;
        //把表格添加到视图
        self.view.addSubview(tableView)
        //MARK:导航条右侧按钮
        let RightBtn = UIBarButtonItem(title: "右按钮", style: .plain, target: self, action: #selector(rightbtn))
        //把右侧按钮添加到右侧
        self.navigationItem.rightBarButtonItem = RightBtn
        //MARK:导航条左侧按钮
        let LeftBtn = UIBarButtonItem(title: "左侧带输入框按钮", style: .plain, target: self, action: #selector(leftbtn))
        self.navigationItem.leftBarButtonItem = LeftBtn
    }
    //MARK:设置表格多少分区等
    //多少分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //每个分区有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arr.count
    }
    //设置row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //创建cell
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
         }
        //cell右侧的 “  >  ”
        cell?.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        //cell的选择样式
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        //设置cell的主标题
        cell?.textLabel?.text = Arr[indexPath.row];
        return cell!
    }
    //MARK:表格的点击方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(One_TwoViewController(), animated: true)
        }
    }
    //MARK:表格头文字
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let String = "头文字"
        return String
        
    }
    //MARK:右侧按钮点击的方法,底侧弹出,点击确定后维持1秒文字
    @objc func rightbtn() -> Void {
        //MARK:弹出框,新版。
        //  actionSheet为下部展示 , alert为中部展示
        let alert = UIAlertController(title: "点击了导航条右侧按钮", message: nil, preferredStyle: .actionSheet)
        //添加弹出框按钮   .ccancel为取消按钮
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
            //设置一个弹窗 , 1秒后消失
            let alertControlle = UIAlertController(title: "好的,你很棒", message: nil, preferredStyle: .alert)
            
            self.present(alertControlle, animated: true, completion: nil)
            //。设置1秒后消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                self.presentedViewController?.dismiss(animated: true, completion: nil)
            })
        }))
        //展示弹出框
        self.present(alert, animated: true, completion: nil)
    }
    //MARK:左侧点击按钮,带输入框,中间弹出
    @objc func leftbtn() -> Void {
        let alert = UIAlertController(title: "请输入", message: nil, preferredStyle: .alert)
        alert.addTextField { (text:UITextField) in
            text.placeholder = "请输入您的账号"
        }
        alert.addTextField { (text:UITextField) in
            text.placeholder = "请输入您的密码"
            text.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (UIAlertAction) in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

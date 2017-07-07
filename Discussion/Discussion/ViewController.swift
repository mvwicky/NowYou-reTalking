//
//  ViewController.swift
//  Discussion
//
//  Created by Patrick Tomas on 5/21/17.
//  Copyright © 2017 Patrick Tomas. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let Array: NSArray = ["CNN fires Kathy Griffin from New Year's Eve show", "Trump cuts Epa Funding by 31%", "Trump Signs Bill Revoking Obama-Era Gun Checks", "Egypt's new NGO law"]
    var myTableView: UITableView!
    
    let sec: DiscussionVC = DiscussionVC(nibName: nil, bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        var label = UILabel()
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = 600
        
        
        
        label = UILabel(frame: CGRect(x:40, y:30, width:350, height:40))
        label.text=("Now You're Talking")
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.layer.shadowOffset = CGSize(width: 0, height: 5)
        label.layer.shadowOpacity = 1/Users/patricktomas/Desktop/topicsPG.png
        myTableView = UITableView(frame: CGRect(x: 0, y: 100, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        self.view.addSubview(label)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var topicNum = indexPath.row
        
        print("Num: \(indexPath.row)")
        print("Topic: \(Array[indexPath.row])")
        
       let discussionVC:DiscussionVC = DiscussionVC()
        self.present(discussionVC, animated: true, completion: nil)

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(Array[indexPath.row])"
        return cell
    }
    
    
}


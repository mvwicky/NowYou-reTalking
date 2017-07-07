//
//  DiscussionVC.swift
//  Discussion
//
//  Created by Patrick Tomas on 5/21/17.
//  Copyright © 2017 Patrick Tomas. All rights reserved.
//

import UIKit

class DiscussionVC: UIViewController, UITextViewDelegate {

    var activeField: UITextField?
    var UserBias = 3
    var myString = NSString()
    var myTextField = UITextField.self

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let image = UIImage(named: "BackButton.png") as UIImage?
        let button = UIButton(frame: CGRect(x: 20, y: 30, width: 14, height: 24))
        
        

        button.backgroundColor = UIColor.white
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(ratingButtonTapped), for: .touchUpInside)
        self.view.addSubview(button)
        
        let WSJimage = UIImage(named: "WSJButton.jpg") as UIImage?
        let WSJbutton = UIButton(frame: CGRect(x: 120, y: 180, width: 75, height: 75))
        WSJbutton.layer.cornerRadius = 5
        WSJbutton.backgroundColor = UIColor.white
        WSJbutton.setImage(WSJimage, for: .normal)
        WSJbutton.addTarget(self, action: #selector(WSJButtonTapped), for: .touchUpInside)
        self.view.addSubview(WSJbutton)

        let Gimage = UIImage(named: "GButton.jpg") as UIImage?
        let Gbutton = UIButton(frame: CGRect(x: 220, y: 180, width: 75, height: 75))
        Gbutton.layer.cornerRadius = 5
        Gbutton.backgroundColor = UIColor.white
        Gbutton.setImage(Gimage, for: .normal)
        Gbutton.addTarget(self, action: #selector(GButtonTapped), for: .touchUpInside)
        self.view.addSubview(Gbutton)
        
        let yimage = UIImage(named: "yButton.png") as UIImage?
        let ybutton = UIButton(frame: CGRect(x: 50, y: 180, width: 50, height: 50))
        ybutton.backgroundColor = UIColor.white
        ybutton.setImage(yimage, for: .normal)
        ybutton.addTarget(self, action: #selector(yButtonTapped), for: .touchUpInside)
        self.view.addSubview(ybutton)
        
        let nimage = UIImage(named: "nButton.png") as UIImage?
        let nbutton = UIButton(frame: CGRect(x: 300, y: 180, width: 50, height: 50))
        nbutton.backgroundColor = UIColor.white
        nbutton.setImage(nimage, for: .normal)
        nbutton.addTarget(self, action: #selector(nButtonTapped), for: .touchUpInside)
        self.view.addSubview(nbutton)
        
        let sendimage = UIImage(named: "sendButton.png") as UIImage?
        let sendButton = UIButton(frame: CGRect(x: 335, y: 625, width: 30, height: 30))
        sendButton.backgroundColor = UIColor.white
        sendButton.setImage(sendimage, for: .normal)
        sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
        self.view.addSubview(sendButton)

        
        var myTextField: UITextField = UITextField(frame: CGRect(x: 50, y: 620, width: 280, height: 40))
        myTextField.text = "What do you think"
        myTextField.borderStyle = UITextBorderStyle.line
        myTextField.layer.cornerRadius = 5
        self.view.addSubview(myTextField)
        
        let myTextView: UITextView = UITextView(frame: CGRect(x: 15, y: 250, width: 350.00, height: 360.00))
        myTextView.text = " \(myString)"
        myTextView.isUserInteractionEnabled = false
        myTextView.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        myTextView.layer.borderWidth = 1.0
        myTextView.layer.cornerRadius = 5
        self.view.addSubview(myTextView)
        
        var label = UILabel()
        label = UILabel(frame: CGRect(x:0, y:30, width:350, height:40))
        label.frame.origin = CGPoint(x: self.view.frame.width / 2 - 30, y: 30)
        label.text="Topic"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.layer.shadowOffset = CGSize(width: 0, height: 5)
        label.layer.shadowOpacity = 30
        self.view.addSubview(label)
        self.view.addSubview(button)
        self.view.addSubview(ybutton)
        self.view.addSubview(nbutton)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
            // Do any additional setup after loading the view.
    }
    
    func sendTapped() {
        print("user input")
        let replaced = (myString as NSString).replacingOccurrences(of: " ", with: "\(myTextField)")
    }
    
    func ratingButtonTapped() {
        print("Back")
        let viewController:ViewController = ViewController()
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    func yButtonTapped() {
        print("User would agree with this")
        UserBias = 1
    }
    
    func nButtonTapped() {
        print("User would not agree with this")
        UserBias = 2
    }
    
    func WSJButtonTapped() {
        print("looking at info")
        UIApplication.shared.openURL(NSURL(string: "https://www.wsj.com/")! as URL)
    }

    func GButtonTapped() {
        print("looking at info")
        UIApplication.shared.openURL(NSURL(string: "https://news.google.com/")! as URL)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self);
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.frame.origin.y = 0
        })
        view.endEditing(true)
    }
    
    func keyboardWasShown(notification: NSNotification) {
        let info = notification.userInfo!
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.frame.origin.y = -210
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

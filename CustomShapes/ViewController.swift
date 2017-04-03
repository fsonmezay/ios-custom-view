//
//  ViewController.swift
//  CustomShapes
//
//  Created by Ferdi Sonmezay on 28/02/17.
//  Copyright © 2017 Ferdi Sonmezay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customView : CustomView = {
        let view = CustomView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 25
        return view
    }()
    
    let profileImage: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "profile")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 35
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = true
        return profileImageView
    }()
    
    let segmentedController: UISegmentedControl = {
        let sc = UISegmentedControl(items:["Add", "Message"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.selectedSegmentIndex = 0
        sc.tintColor = UIColor(red:40/255, green: 40/255, blue: 40/255, alpha: 1)
        sc.layer.cornerRadius = 0.0
        sc.layer.borderColor = UIColor(red:240/255, green: 240/255, blue: 240/255, alpha: 1).cgColor
        sc.layer.borderWidth = 0.1;
        sc.layer.masksToBounds = true
        return sc
    }()
    
    let nameTextView: UITextView = {
        let nameTextView = UITextView()
        nameTextView.text = "Ferdi Sönmezay"
        nameTextView.isEditable = false
        nameTextView.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightThin)
        nameTextView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        nameTextView.textColor = UIColor.black
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        return nameTextView
    }()
    
    let summaryTextView: UITextView = {
        let summaryTextView = UITextView()
        summaryTextView.text = "Senior Software Developer, Ankara"
        summaryTextView.isEditable = false
        summaryTextView.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        summaryTextView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        summaryTextView.textColor = UIColor.darkGray
        summaryTextView.translatesAutoresizingMaskIntoConstraints = false
        return summaryTextView
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        view.addSubview(customView)
        view.addSubview(profileImage)
        view.addSubview(nameTextView)
        view.addSubview(summaryTextView)
        view.addSubview(segmentedController)
        //self.view.backgroundColor = UIColor.lightGray
        
        
        setupCustomView()
        setupProfileImage()
        setupNameTextView()
        setupSummaryTextView()
        setupSegmentedController()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupCustomView() {
        customView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
        customView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        customView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        customView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        customView.backgroundColor = UIColor(red: 100/255, green: 53/255, blue: 121/255, alpha: 0.0)
    }
    
    func setupProfileImage() {
        profileImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant:50).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-30).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
    func setupNameTextView() {
        nameTextView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant:10).isActive = true
        nameTextView.leftAnchor.constraint(equalTo: profileImage.leftAnchor, constant:-10).isActive = true
        nameTextView.widthAnchor.constraint(equalTo: customView.widthAnchor, constant: -40).isActive = true
        nameTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    func setupSummaryTextView() {
        summaryTextView.topAnchor.constraint(equalTo: nameTextView.bottomAnchor).isActive = true
        summaryTextView.leftAnchor.constraint(equalTo: nameTextView.leftAnchor).isActive = true
        summaryTextView.widthAnchor.constraint(equalTo: nameTextView.widthAnchor).isActive = true
        summaryTextView.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func setupSegmentedController() {
        segmentedController.topAnchor.constraint(equalTo: summaryTextView.bottomAnchor, constant:10).isActive = true
        segmentedController.leftAnchor.constraint(equalTo: view.leftAnchor, constant:15).isActive = true
        segmentedController.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        segmentedController.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
}



//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arrayImages1 = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    var arrayImages2 =  [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    var landscape: [NSLayoutConstraint]?
    var portrait: [NSLayoutConstraint]?
    var isPortrait: Bool = false
    
    
    let logoImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "DiceeLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imageDiceOne: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "DiceTwo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
      
        return imageView
    }()
    
    let imageDiceTwo: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "DiceTwo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let buttonRolling: UIButton = {
       let button = UIButton()
        button.setTitle("Roll", for: .normal)
        button.titleLabel?.font = UIFont(name: "Thonburi-Bold", size: 40)
        button.addTarget( .none, action: #selector(rollingDice), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    let backgroundImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "GreenBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(view.frame.size)
        
      
        
        setView()
        setConstraition()
    }


    
    func setView() {
        view.addSubview(logoImage)
        view.addSubview(imageDiceOne)
        view.addSubview(imageDiceTwo)
        view.addSubview(buttonRolling)
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
    }
    
    
  @objc func rollingDice(sender: UIAction) {
      let randomNumber = Int.random(in: 0...5)
      let randomNumber1 = Int.random(in: 0...5)
      imageDiceOne.image = arrayImages1[randomNumber1]
      imageDiceTwo.image = arrayImages2[randomNumber]
    }
    
    
    func setConstraition() {
     
        landscape = [
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logoImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
        logoImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
        
        imageDiceOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        imageDiceOne.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
        
        imageDiceTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
        imageDiceTwo.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
        
        buttonRolling.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 120 ),
        buttonRolling.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80),
        buttonRolling.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
       
        
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
            
            portrait = [
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logoImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            imageDiceOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            imageDiceOne.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            
            imageDiceTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 240),
            imageDiceTwo.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            buttonRolling.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150 ),
            buttonRolling.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80),
            buttonRolling.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
           
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        
    }
    override func viewDidLayoutSubviews() {
        isPortrait = UIDevice.current.orientation.isPortrait
        if isPortrait {
            NSLayoutConstraint.deactivate(landscape!)
            NSLayoutConstraint.activate(portrait!)
        } else {
            NSLayoutConstraint.deactivate(portrait!)
            NSLayoutConstraint.activate(landscape!)
        }
    }
}

//
//  ViewController.swift
//  Timer
//
//  Created by Артем Соловьев on 07.07.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = CGFloat(view.frame.width)
        let height = CGFloat(view.frame.height)
        
        let nameTextField =  UITextField(frame: CGRect(x: width/10, y: height/10, width: width*0.8, height: 40))
        nameTextField.placeholder = "Название таймера"
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.returnKeyType = UIReturnKeyType.done
        nameTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        nameTextField.delegate = self
        view.addSubview(nameTextField)
        
        let timeTextField =  UITextField(frame: CGRect(x: width/10, y: height*0.2, width: width*0.8, height: 40))
        timeTextField.placeholder = "Время в секундах"
        timeTextField.font = UIFont.systemFont(ofSize: 15)
        timeTextField.borderStyle = UITextField.BorderStyle.roundedRect
        timeTextField.keyboardType = UIKeyboardType.numberPad
        timeTextField.delegate = self
        view.addSubview(timeTextField)
        
        let button = UIButton(frame: CGRect(x: width/10, y: height*0.3, width: width*0.8, height: 40))
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray6
        button.setTitle("Добавить", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func buttonAction(sender: UIButton!) {
       print("Button tapped")
    }
}


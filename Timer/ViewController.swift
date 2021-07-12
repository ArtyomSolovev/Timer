//
//  ViewController.swift
//  Timer
//
//  Created by Артем Соловьев on 07.07.2021.
//

import UIKit

var names = [String]()
var timers = [Int]()

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate {
    
    var timer = Timer()
    var tableView = UITableView()
    let id = "myCell"
    var nameTextField = UITextField()
    var timeTextField = UITextField()
    var button = UIButton()
    
    fileprivate func createTable(_ height: CGFloat, _ width: CGFloat) {
        self.tableView = UITableView(frame: CGRect(x: 0, y: height*0.4, width: width, height: height*0.6), style: .plain)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: id)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    fileprivate func setUpButton(_ width: CGFloat, _ height: CGFloat) {
        button = UIButton(frame: CGRect(x: width/10, y: height*0.3, width: width*0.8, height: 40))
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray6
        button.setTitle("Добавить", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    fileprivate func setUpNameTF(_ width: CGFloat, _ height: CGFloat) {
        nameTextField = UITextField(frame: CGRect(x: width/10, y: height/10, width: width*0.8, height: 40))
        nameTextField.placeholder = "Название таймера"
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.returnKeyType = UIReturnKeyType.done
        nameTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        nameTextField.delegate = self
    }
    
    fileprivate func setUpTimeTF(_ width: CGFloat, _ height: CGFloat) {
        timeTextField = UITextField(frame: CGRect(x: width/10, y: height*0.2, width: width*0.8, height: 40))
        timeTextField.placeholder = "Время в секундах"
        timeTextField.font = UIFont.systemFont(ofSize: 15)
        timeTextField.borderStyle = UITextField.BorderStyle.roundedRect
        timeTextField.keyboardType = UIKeyboardType.numbersAndPunctuation
        nameTextField.returnKeyType = UIReturnKeyType.done
        timeTextField.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerCount), userInfo: nil, repeats: true)
        let width = CGFloat(view.frame.width)
        let height = CGFloat(view.frame.height)
        
        setUpNameTF(width, height)
        setUpTimeTF(width, height)
        setUpButton(width, height)
        createTable(height, width)
        view.addSubview(nameTextField)
        view.addSubview(timeTextField)
        view.addSubview(button)
        view.addSubview(tableView)
        
    }
    @objc func timerCount(){
        var countOfTimers = timers.count
        var i = 0
        while i < countOfTimers{
            switch timers[i] {
            case 1...:
                timers[i] -= 1
            case 0:
                names.remove(at: timers[i])
                timers.remove(at: timers[i])
                i -= 1
                countOfTimers -= 1
            default:
                print("Пусто(")
            }
            i += 1
        }
        tableView.reloadData()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if nameTextField.text != "" && timeTextField.text != ""{
            names.append(nameTextField.text!)
            nameTextField.text = ""
            timers.append(Int(timeTextField.text!)!)
            timeTextField.text = ""
            tableView.reloadData()
        }
        (names, timers) = sorted(names: names, timers: timers)
        tableView.reloadData()
    }

//    MARK: - UITableViewDataSource
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
           case tableView:
              return names.count
            default:
              return 0
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? TableViewCell
        cell?.textLabel?.text = names[indexPath.row]
        cell?._timer.text = getTime(seconds: timers[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
}

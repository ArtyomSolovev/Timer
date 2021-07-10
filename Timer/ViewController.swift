//
//  ViewController.swift
//  Timer
//
//  Created by Артем Соловьев on 07.07.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate {

//    let topView: UIView  = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .red
//        return view
//    }()
//
//    let bottomView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .blue
//        return view
//    }()
//
//    let button: UIButton = {
//        let button = UIButton(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
//        button.setTitle("Добавить", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
//    private let tableView: UITableView = {
//        let tableView = UITableView(frame: CGRect(x: width/10, y: height/10, width: width*0.8, height: 40))
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return tableView
//    }()

    
    var names = ["swif", "c++", "java"]
    var timers = [1,2,3]
    
    var tableView = UITableView()
    let id = "myCell"
    var nameTextField = UITextField()
    
    fileprivate func createTable(_ height: CGFloat, _ width: CGFloat) {
        self.tableView = UITableView(frame: CGRect(x: 0, y: height*0.4, width: width, height: height*0.6), style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = CGFloat(view.frame.width)
        let height = CGFloat(view.frame.height)
        
        nameTextField = UITextField(frame: CGRect(x: width/10, y: height/10, width: width*0.8, height: 40))
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
        

        createTable(height, width)
        
        
//        view.addSubview(topView)
//        view.addSubview(bottomView)
//        tableView.backgroundColor = .link
//        view.addSubview(tableView)
//        setupTopView()
//        setupBottomView()
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.bounds
//    }

    
//    func setupTopView() {
//        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        topView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        topView.heightAnchor.constraint(equalToConstant: 250).isActive = true
//    }
//
//    func setupBottomView() {
//        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
//        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        bottomView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -250).isActive = true
//    }
    
    @objc func buttonAction(sender: UIButton!) {
        if nameTextField.text != ""{
            names.append(nameTextField.text ?? "")
            nameTextField.text = ""
            tableView.reloadData()
        }
    }

//    MARK: - UITableViewDataSource
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
           case tableView:
              return self.names.count
            default:
              return 0
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        print("pause")
        return .none
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            data.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .left)
//        }
//    }
}

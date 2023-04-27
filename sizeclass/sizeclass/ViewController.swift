//
//  ViewController.swift
//  sizeclass
//
//  Created by Anarock on 11/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - uicomponents
    
    
    /// should not use this type of declaration instead create instance and then define all constraints and use it wherever
    private let table: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .systemBackground
        tableview.allowsSelection = true
        tableview.register(CustomCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    

    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.table.delegate=self
        self.table.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    //MARK: - setup UI
    private func setupUI(){
        self.view.backgroundColor = .systemBlue
        self.view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.topAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! CustomCell
        let model=arr[indexPath.row]
        
        cell.myImageView.image = UIImage(named: model.img)
        cell.myLabel.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}



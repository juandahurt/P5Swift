//
//  ViewController.swift
//  P5Demo
//
//  Created by Juan Hurtado on 13/06/23.
//

import P5Swift
import UIKit

class ViewController: UIViewController {
    lazy var examples: [P5Sketch] = [
        FractalOrganicTree(ofSize: view.frame.size),
        GameOfLife(ofSize: view.frame.size)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        title = "Examples"
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = examples[indexPath.row].title
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        examples.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let example = examples[indexPath.row]
        example.redraw()
        let viewController = UIViewController()
        viewController.title = example.title
        viewController.view.addSubview(example.view)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

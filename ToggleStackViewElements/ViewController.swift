//
//  ViewController.swift
//  ToggleStackViewElements
//
//  Created by Theo Vora on 9/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello world"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderColor = UIColor(ciColor: .red).cgColor
        label.layer.borderWidth = 1.0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(helloLabel)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            helloLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            helloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            helloLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            helloLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


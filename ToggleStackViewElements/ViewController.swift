//
//  ViewController.swift
//  ToggleStackViewElements
//
//  Created by Theo Vora on 9/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    var showHelloLabel: Bool = true {
        didSet {
            helloLabel.isHidden = !showHelloLabel
        }
    }
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.applyBorder(.cyan)
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var helloLabel: UILabel = {
        let label = label(text: "hi there")
        return label
    }()
    
    lazy var toggleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.applyBorder(.blue)
        button.backgroundColor = .white
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        print("button created")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyAttributes()
        applyConstraints()
        applyColors()
    }
    
    func label(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.applyBorder()
        return label
    }
    
    private func applyAttributes() {
        view.addSubview(vStack)
        view.addSubview(toggleButton)
        vStack.addArrangedSubview(helloLabel)
        vStack.addArrangedSubview(label(text: "come here"))
        vStack.addArrangedSubview(label(text: "my little friend"))
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
//        helloLabel.isEnabled = false // just grays it out
//        helloLabel.isHidden = true // this works. and the stack view adjusts to fill the space.
        showHelloLabel = true
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            toggleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 52),
            toggleButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            toggleButton.widthAnchor.constraint(equalToConstant: 120),
            vStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 52),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            vStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -52),
        ])
    }
    
    private func applyColors() {
        view.backgroundColor = .white
    }
    
    @objc private func toggleButtonTapped() {
        showHelloLabel.toggle()
    }
}

extension UIView {
    func applyBorder(_ color: CIColor = .red, border: CGFloat = 1.0) {
        self.layer.borderColor = UIColor(ciColor: color).cgColor
        self.layer.borderWidth = border
    }
}

//
//  ViewController.swift
//  ToggleStackViewElements
//
//  Created by Theo Vora on 9/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.applyBorder(.cyan)
        stack.distribution = .fillEqually
        return stack
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
        vStack.addArrangedSubview(label(text: "hello there"))
        vStack.addArrangedSubview(label(text: "come here"))
        vStack.addArrangedSubview(label(text: "my little friend"))
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 52),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            vStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -52),
        ])
    }
    
    private func applyColors() {
        view.backgroundColor = .white
    }
}

extension UIView {
    func applyBorder(_ color: CIColor = .red, border: CGFloat = 1.0) {
        self.layer.borderColor = UIColor(ciColor: color).cgColor
        self.layer.borderWidth = border
    }
}

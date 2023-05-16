//
//  SwiftCodeKitViewController.swift
//  SwiftCodeKit
//
//  Created by Maksim Kalik on 9/29/22.
//

import UIKit

final class SwiftCodeKitViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 128, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 5
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(stepperChanged), for: .valueChanged)
        return stepper
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.backgroundColor = .black.withAlphaComponent(0.1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftCodeKit.swiftCodeKitDidStart?()
        setupViews()
        
        DispatchQueue.main.async {
            guard let user = Dummy.user1.jsonString else { return }
            user.utf8CString.withUnsafeBufferPointer { buffer in
                let result = buffer.baseAddress
                SwiftCodeKit.swiftCodeKitUserPointerDidUpdate?(result)
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            guard let user = Dummy.user2.jsonString else { return }

            let userString = strdup(user)
            SwiftCodeKit.swiftCodeKitUserPointerDidUpdate?(userString)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            guard let user = Dummy.user3.jsonString else { return }
            
            let userString = strdup(user)
            SwiftCodeKit.swiftCodeKitUserPointerDidUpdate?(userString)
        }
    }
    
    func setupViews() {
        view.backgroundColor = .white
        label.text = String(stepper.value)
        
        view.addSubview(button)
        view.addSubview(stepper)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 92),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            
            stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepper.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension SwiftCodeKitViewController {
    @objc
    func onTap() {
        dismiss(animated: true)
        SwiftCodeKit.swiftCodeKitDidFinish?()
    }
    
    @objc
    func stepperChanged(_ sender: UIStepper) {
        label.text = String(sender.value)
        SwiftCodeKit.swiftCodeKitStepperValueDidChange?(sender.value)
    }
}

extension SwiftCodeKitViewController {
    func configureStepper(min: Double, max: Double) {
        stepper.minimumValue = min
        stepper.maximumValue = max
    }
    
    func configureStepper(value: Double) {
        stepper.value = value
    }
    
    var stepperValue: Double {
        stepper.value
    }
}

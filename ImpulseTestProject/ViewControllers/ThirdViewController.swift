//
//  ThirdViewController.swift
//  ImpulseTestProject
//
//  Created by Леонід Шевченко on 17.08.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .darkGray
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 30
        return containerView
    }()
    
    private lazy var continueButton: UIButton = {
        let continueButton = UIButton()
        continueButton.backgroundColor = .orange
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(16), weight: .semibold)
        continueButton.layer.cornerRadius = 10
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        return continueButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50)
        setupView()
    }
    
    func setupView(){
        view.addSubview(containerView)
        containerView.addSubview(continueButton)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(containerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(containerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(containerView.widthAnchor.constraint(equalToConstant: view.frame.width - 30))
        constraints.append(containerView.heightAnchor.constraint(equalToConstant: view.frame.height / 2))
        
        constraints.append(continueButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20))
        constraints.append(continueButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20))
        constraints.append(continueButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20))
        constraints.append(continueButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, constant: -200))
        

        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func continueButtonPressed() {
        print("continueButton in ThirdViewController Pressed")
    }
    
    
}

//
//  ViewController.swift
//  ImpulseTestProject
//
//  Created by Леонід Шевченко on 17.08.2022.
//

import UIKit

class FirstViewController: UIViewController {
    // MARK: - Variables/Constants
    let buttonConfig = UIButton.Configuration.nextButtonSetUp(text: "Start")
    private lazy var startButton: UIButton = {
        let value: UIButton = .init()
        value.configuration = buttonConfig
        value.addTarget(
            self,
            action: #selector(startButtonPressed),
            for: .touchUpInside)
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIForFirstVC()
    }
    
    // MARK: - Functions
    @objc func startButtonPressed() {
        let secondVC = UINavigationController(rootViewController: SecondViewController())
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .flipHorizontal
        present(secondVC, animated: true)
    }
    
    private func setUpUIForFirstVC() {
        view.backgroundColor = .black
        view.addSubview(startButton)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(startButton.widthAnchor.constraint(equalToConstant: 244))
        constraints.append(startButton.heightAnchor.constraint(equalToConstant: 52))
        NSLayoutConstraint.activate(constraints)
    }
}


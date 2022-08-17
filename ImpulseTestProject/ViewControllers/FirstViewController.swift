//
//  ViewController.swift
//  ImpulseTestProject
//
//  Created by Леонід Шевченко on 17.08.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Variables/Constants
    private lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.backgroundColor = .orange
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(16), weight: .semibold)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        return startButton
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


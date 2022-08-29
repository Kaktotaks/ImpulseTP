//
//  ThirdViewController.swift
//  ImpulseTestProject
//
//  Created by Леонід Шевченко on 17.08.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    // MARK: - Variables/Constants
    let buttonConfig = UIButton.Configuration.nextButtonSetUp(text: "Continue")
    private lazy var stackView: UIStackView = {
        let value: UIStackView = .init()
        value.backgroundColor = UIColor(red: 0.166, green: 0.169, blue: 0.175, alpha: 1)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.isLayoutMarginsRelativeArrangement = true
        value.layoutMargins = .init(
            top: 30,
            left: 20,
            bottom: 30,
            right: 20
        )
        value.clipsToBounds = true
        value.layer.cornerRadius = 30
        return value
    }()
    private lazy var progressView: UIProgressView = {
        let value: UIProgressView = .init(progressViewStyle: .default)
        value.trackTintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.24)
        value.progressTintColor = .orange
        value.translatesAutoresizingMaskIntoConstraints = false
        value.clipsToBounds = true
        return value
    }()
    private let progress = Progress(totalUnitCount: 60)
    private var timer = Timer()
    private lazy var timerLabel: UILabel = {
        let value = UILabel()
        value.textColor = .white
        value.textAlignment = NSTextAlignment.center
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "00:00"
        value.font = UIFont.systemFont(ofSize: 68, weight: .bold)
        value.adjustsFontSizeToFitWidth = true
        return value
    }()
    private lazy var continueButton: UIButton = {
        let value = UIButton()
        value.alpha = 0.5
        value.configuration = buttonConfig
        value.translatesAutoresizingMaskIntoConstraints = false
        return value
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        progressStart()
    }
    
    // MARK: - Functions
    @objc func continueButtonPressed() {
        print("continueButton in ThirdViewController Pressed")
        self.dismiss(animated: true)
    }
    
    private func progressStart() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
            guard let self = self else { return }
            
            let seconds = self.progress.completedUnitCount
            let minutes = self.progress.completedUnitCount / 60
            
            guard self.progress.isFinished == false else {
                timer.invalidate()
                print("timer is finished")
                self.timerLabel.text = String(format: "%02i:%02i", minutes, 0)
                self.continueButton.addTarget(self, action: #selector(self.continueButtonPressed), for: .touchUpInside)
                self.continueButton.alpha = 1.0
                return
            }
            
            self.progress.completedUnitCount += 1
            self.timerLabel.text = String(format: "%02i:%02i", minutes, seconds)
            
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progressView.setProgress(progressFloat, animated: true)
        }
    }
}

// MARK: - configure UI
extension ThirdViewController {
    private func configureUI(){
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50)
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.addArrangedSubview(timerLabel)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(continueButton)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constraints.append(stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor))
        constraints.append(stackView.widthAnchor.constraint(equalToConstant: view.frame.width - 30))
        constraints.append(stackView.heightAnchor.constraint(equalToConstant: view.frame.height / 2))
        
        constraints.append(timerLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -60))
        constraints.append(timerLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.4))
        
        constraints.append(progressView.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -60))
        constraints.append(progressView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.02))
        
        constraints.append(continueButton.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: -60))
        constraints.append(continueButton.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.15))
        
        NSLayoutConstraint.activate(constraints)
    }
}

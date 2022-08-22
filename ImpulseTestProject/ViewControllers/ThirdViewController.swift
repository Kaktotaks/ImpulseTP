//
//  ThirdViewController.swift
//  ImpulseTestProject
//
//  Created by Леонід Шевченко on 17.08.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .darkGray
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 30, left: 20, bottom: 30, right: 20)
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 30
        return stackView
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .lightGray
        progressView.progressTintColor = .orange
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.clipsToBounds = true
        return progressView
    }()
    
    private let progress = Progress(totalUnitCount: 60)
    private var timer = Timer()
    
    private lazy var timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.textColor = .white
        timerLabel.textAlignment = NSTextAlignment.center
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.text = "00:00"
        timerLabel.font = UIFont.systemFont(ofSize: 75, weight: .bold)
        timerLabel.adjustsFontSizeToFitWidth = true
        return timerLabel
    }()
    
    private lazy var continueButton: UIButton = {
        let continueButton = UIButton()
        continueButton.backgroundColor = .orange
        continueButton.alpha = 0.5
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(16), weight: .semibold)
        continueButton.layer.cornerRadius = 10
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.isEnabled = false
        return continueButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50)
        configureStackView()
        progressStart()
    }
    
    func configureStackView(){
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
    
    @objc func continueButtonPressed() {
        print("continueButton in ThirdViewController Pressed")
        
        // watched == true + saved 🌝
        self.dismiss(animated: true)
    }
    
    func progressStart() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] (timer) in
            guard let self = self else { return }
            
            let seconds = self.progress.completedUnitCount
            let minutes = self.progress.completedUnitCount / 60
            
            guard self.progress.isFinished == false else {
                timer.invalidate()
                print("timer is finished")
                self.timerLabel.text = String(format: "%02i:%02i", minutes, 0)
                self.continueButton.isEnabled = true
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

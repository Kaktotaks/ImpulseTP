//
//  SecondViewController.swift
//  ImpulseTestProject
//
//  Created by Леонід Шевченко on 17.08.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Variables/Constants
    private lazy var image: UIImageView = {
        let image: UIImageView = .init()
        image.image = UIImage(named: "firstImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var scrolView = UIScrollView()
    
    private lazy var pageControll: UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.numberOfPages = 3
        pageControll.backgroundColor = .black
        pageControll.addTarget(self,
                               action: #selector(pageControllDidChanged(_:)),
                               for: .valueChanged)
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        return pageControll
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = .orange
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(16), weight: .semibold)
        nextButton.layer.cornerRadius = 10
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        return nextButton
    }()
    
    private lazy var images = ["firstImage", "secondImage", "thirdImage"]
    private lazy var mainLabels = ["Boost Productivity", "Work Seamlessly", "Achieve Your Goals"]
    private lazy var labels = ["Take your productivity to the next level", "Get your work done seamlessly without interruption", "Boosted productivity will help you achieve the desired goals"]
    
    // MARK: - View life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrolView.delegate = self
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureLayoutSubviews()
    }
    
    // MARK: - Functions
    private func configureLayoutSubviews() {
        view.addSubview(scrolView)
        view.addSubview(pageControll)
        view.addSubview(nextButton)
        scrolView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - (view.frame.height / 5))
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(pageControll.topAnchor.constraint(equalTo: nextButton.topAnchor, constant: -50))
        constraints.append(pageControll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +40))
        constraints.append(pageControll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40))
        constraints.append(pageControll.heightAnchor.constraint(equalToConstant: 40))
        
        constraints.append(nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40))
        constraints.append(nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: +40))
        constraints.append(nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40))
        constraints.append(nextButton.heightAnchor.constraint(equalToConstant: 52))
        
        NSLayoutConstraint.activate(constraints)
        
        if scrolView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    private func configureScrollView() {
        scrolView.contentSize = CGSize(width: view.frame.size.width*3, height: scrolView.frame.size.height)
        scrolView.isPagingEnabled = true
        scrolView.showsVerticalScrollIndicator = false
        scrolView.showsHorizontalScrollIndicator = false
        
        for x in 0..<3 {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width,
                                            y: view.safeAreaInsets.bottom,
                                            width: view.frame.size.width,
                                            height: scrolView.frame.size.height))
            page.translatesAutoresizingMaskIntoConstraints = false
            
            let label = UILabel(frame: CGRect(x: page.bounds.midX - 130, y: page.bounds.maxY - 110, width: 260, height: 50))
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textColor = .white
            label.text = labels[x]
            
            let mainLabel = UILabel(frame: CGRect(x: page.bounds.midX - 100, y: page.bounds.maxY - 150, width: 200, height: 20))
            mainLabel.textAlignment = .center
            mainLabel.font = .systemFont(ofSize: 22, weight: .bold)
            mainLabel.textColor = .white
            mainLabel.text = mainLabels[x]
            
            let uiImage = UIImage(named: "\(images[x])")
            let imageView = UIImageView(frame: CGRect(x: view.frame.midX - (view.frame.width / 3), y: view.frame.midY - (view.frame.height / 1.6) + 40, width: view.frame.width / 1.4, height: view.frame.height / 1.4))
            imageView.contentMode = .scaleAspectFit
            imageView.image = uiImage
            
            scrolView.addSubview(page)
            
            page.addSubview(label)
            page.addSubview(mainLabel)
            page.addSubview(imageView)
        }
    }
    
    @objc private func pageControllDidChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrolView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width,
                                           y: 0),
                                   animated: true)
    }
    
    @objc func nextButtonPressed() {
        print("NextButton pressed")
        
    }
}

extension SecondViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(floor(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}

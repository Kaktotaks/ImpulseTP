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
        pageControll.backgroundColor = .gray
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrolView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(scrolView)
        view.addSubview(pageControll)
        view.addSubview(nextButton)
        scrolView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 200)
        
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
    
    // MARK: - Functions
    private func configureScrollView() {
        scrolView.contentSize = CGSize(width: view.frame.size.width*3, height: scrolView.frame.size.height)
        scrolView.isPagingEnabled = true
        scrolView.showsVerticalScrollIndicator = false
        scrolView.showsHorizontalScrollIndicator = false
        let colors: [UIColor] = [
            .systemRed,
            .systemYellow,
            .systemGreen
        ]
        
//        let images = ["firstImage", "secondImage", "thirdImage"]
//        let mainLabels = ["First", "Second", "Third"]
//        let labels = ["First", "Second", "Third"]
        
        for x in 0..<3 {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width,
                                            y: 0,
                                            width: view.frame.size.width,
                                            height: scrolView.frame.size.height))
            
//            let image = UIImage(named: images[x])

            
            
            page.backgroundColor = colors[x]
            scrolView.addSubview(page)
//            page.addSubview(image)
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

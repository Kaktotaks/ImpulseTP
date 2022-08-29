//
//  UIButtonExtension.swift
//  ImpulseTestProject
//
//  Created by Леонід Шевченко on 29.08.2022.
//

import UIKit

extension UIButton.Configuration {
    static func nextButtonSetUp(text: String) -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.titleAlignment = .center
        config.cornerStyle = .medium
        config.background.backgroundColor = .orange
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 16)
        config.attributedTitle = AttributedString(text, attributes: container)
        return config
    }
}

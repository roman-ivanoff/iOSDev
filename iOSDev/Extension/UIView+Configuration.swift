//
//  UIView+Configuration.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import UIKit

extension UIView {
  func addAutoLayoutSubviews(_ views: UIView...) {
    for view in views {
      view.translatesAutoresizingMaskIntoConstraints = false
      addSubview(view)
    }
  }
}

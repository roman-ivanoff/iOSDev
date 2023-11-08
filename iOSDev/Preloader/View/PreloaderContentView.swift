//
//  PreloaderContentView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class PreloaderContentView: UIView {
  private let loaderImageView = UIImageView().apply {
    $0.image = UIImage(named: "loader")
  }

  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = UIColor(named: "backgroundColor")
    addElements()
    rotateImage(imageView: loaderImageView, time: 7)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addElements() {
    self.addSubview(loaderImageView)
    loaderImageView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      loaderImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      loaderImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      loaderImageView.widthAnchor.constraint(equalToConstant: 32),
      loaderImageView.heightAnchor.constraint(equalToConstant: 32)
    ])
  }

  private func rotateImage(imageView: UIImageView, time: Double) {
    UIView.animate(
      withDuration: time/2,
      delay: 0.0,
      options: .curveLinear,
      animations: {
      imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
    }, completion: { _ in
      UIView.animate(
        withDuration: time/2,
        delay: 0.0,
        options: .curveLinear,
        animations: {
        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*2))
      }, completion: { _ in
        self.rotateImage(imageView: imageView, time: time)
      })
    })
  }
}

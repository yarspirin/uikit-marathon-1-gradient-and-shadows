//
//  RoundedGradientSquareWithShadow.swift
//  GradientAndShadow
//
//  Created by Yaroslav Spirin on 03/07/2023.
//

import UIKit

final class RoundedGradientSquareWithShadow: UIView {
  private static let shadowHorizontalOffsetToSideLengthRatio = 0.01
  private static let shadowVerticalOffsetToSideLengthRatio = 0.05
  private static let shadowRadiusToSideLengthRatio = 0.1
  private static let cornerRadiusToSizeLengthRatio = 0.15
  
  private var gradientLayer: CAGradientLayer?

  init(topLeftColor: UIColor, bottomRightColor: UIColor) {
    super.init(frame: .zero)
    configure(topLeftColor: topLeftColor, bottomRightColor: bottomRightColor)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = Self.cornerRadiusToSizeLengthRatio * sideLength
    layoutGradient()
    layoutShadow()
  }

  private func configure(topLeftColor: UIColor, bottomRightColor: UIColor) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        widthAnchor.constraint(equalTo: heightAnchor),
    ])

    enableGradient(topLeftColor: topLeftColor, bottomRightColor: bottomRightColor)
    enableShadow()
  }

  private func enableGradient(topLeftColor: UIColor, bottomRightColor: UIColor) {
    let gradientLayer = Self.makeGradientLayer(
      topLeftColor: topLeftColor,
      bottomRightColor: bottomRightColor
    )
    layer.insertSublayer(gradientLayer, at: 0)
    self.gradientLayer = gradientLayer
  }

  private func enableShadow() {
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.8
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }

  private func layoutGradient() {
    gradientLayer?.frame = bounds
    gradientLayer?.cornerRadius = Self.cornerRadiusToSizeLengthRatio * sideLength
  }

  private func layoutShadow() {
    layer.shadowOffset = CGSize(
      width: Self.shadowHorizontalOffsetToSideLengthRatio * sideLength,
      height: Self.shadowVerticalOffsetToSideLengthRatio * sideLength
    )
    layer.shadowRadius = Self.shadowRadiusToSideLengthRatio * sideLength
  }
}

extension RoundedGradientSquareWithShadow {
  var sideLength: CGFloat {
    bounds.width
  }
}

extension RoundedGradientSquareWithShadow {
  private static func makeGradientLayer(
    topLeftColor: UIColor,
    bottomRightColor: UIColor
  ) -> CAGradientLayer {
    let gradientLayer = CAGradientLayer()

    gradientLayer.colors = [
      topLeftColor.cgColor,
      bottomRightColor.cgColor
    ]

    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)

    return gradientLayer
  }
}

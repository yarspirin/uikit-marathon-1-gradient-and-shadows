//
//  ViewController.swift
//  GradientAndShadow
//
//  Created by Yaroslav Spirin on 03/07/2023.
//

import UIKit

final class ViewController: UIViewController {

  private static let squareLeadingSpacing = 100.0
  private static let squareSideLength = 120.0

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }

  private func configure() {
    view.backgroundColor = .white

    let roundedSquare = RoundedGradientSquareWithShadow(
      topLeftColor: .red,
      bottomRightColor: .blue
    )

    view.addSubview(roundedSquare)

    NSLayoutConstraint.activate(
      [
        roundedSquare.leftAnchor.constraint(
          equalTo: view.leftAnchor,
          constant: Self.squareLeadingSpacing
        ),
        roundedSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        roundedSquare.widthAnchor.constraint(equalToConstant: Self.squareSideLength),
      ]
    )
  }
}

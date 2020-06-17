//
//  AnimationViewController.swift
//  SpringAnimation
//
//  Created by Bober on 17/06/2020.
//  Copyright © 2020 AntonBu. All rights reserved.
//

import Spring

class AnimationViewController: UIViewController {

    @IBOutlet weak var nextAnimationButton: SpringButton!
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let animations = Animation.getAnimationList()
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign(for: animationView)
        setDesign(for: nextAnimationButton, with: 25)
        setButtonTitle()
        descriptionLabel.text = "Нажимайте на кнопку для перехода к следующей анимации"
    }

    @IBAction func nextAnimationTapped() {
        setAnimationParam()
        descriptionLabel.text = animations[index].getDescription()
        setButtonTitle()
        animationView.animate()
        index = index == animations.count - 1 ? 0: index + 1
    }
    
    private func setAnimationParam() {
        animationView.animation = animations[index].name
        animationView.curve = animations[index].curve
        animationView.duration = CGFloat(animations[index].duration)
        animationView.force = CGFloat(animations[index].force )
    }
    
    private func setDesign(for view: UIView, with radius : CGFloat = 10) {
        view.layer.cornerRadius = radius
        view.layer.shadowOpacity = 7
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 0.8, height: 1.1)
    }
    
    private func setButtonTitle() {
        nextAnimationButton.setTitle("Run animation \(animations[index].name)", for: .normal)
    }
}


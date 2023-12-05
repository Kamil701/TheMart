//
//  BasicFlexibleView.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 16.11.23.
//

import UIKit
import SnapKit

protocol FlexibleViewDelegate: AnyObject {
    func viewWillOpen(_ flexibleView: UIView)
}

protocol Expandable {
    func forceClose()
}

class FlexibleView<T: UIView>: UIView {
    let insertedView = T()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        //stack.spacing = 10
        stack.layer.cornerRadius = 12
        stack.layer.masksToBounds = true
        //stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.lightGray.cgColor
        return stack
    }()
    
    lazy var topView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
        
    }()
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var buttonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .black
        return imageView
    }()
    
    weak var delegate: FlexibleViewDelegate?
    
    private(set) var isOpen = false
    
    public var topColor: UIColor = UIColor(red: 251.0/255.0, green: 199.0/255.0, blue: 43.0/255.0, alpha: 1.0)
    
    init(
        text: String,
        profileImage: UIImage? = nil,
        buttonImage: UIImage? = nil,
        topColor: UIColor? = nil
    ) {
        super.init(frame: .zero)
        commonInit()
        
        self.titleLabel.text = text
        
        if let profileImage {
            self.profileImage.image = profileImage
        }
        
        if let buttonImage {
            self.buttonImage.image = buttonImage
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        makeLayout()
        makeConstraints()
        makeGesture()
        setUpDesignForInsertedView()
        insertedView.isHidden = true
    }
    
    private func setUpDesignForInsertedView() {
        insertedView.layer.cornerRadius = 15
        insertedView.layer.borderWidth = 1
        insertedView.layer.borderColor = UIColor.black.cgColor
        insertedView.clipsToBounds = true
    }
    
    private func makeLayout() {
        self.addSubview(mainStack)
        mainStack.addArrangedSubview(topView)
        topView.addSubview(titleLabel)
        topView.addSubview(buttonImage)
        topView.addSubview(profileImage)
        mainStack.addArrangedSubview(insertedView)
        
    }
    
    private func makeConstraints() {
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.bottom.equalToSuperview()
        }
        
        topView.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }
        
        buttonImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(20)
            make.trailing.equalToSuperview().inset(16)
        }
        
        insertedView.snp.makeConstraints { make in
            make.top.equalTo(mainStack.snp.bottom).offset(10)
        }
    }
    
    private func makeGesture() {
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(tapAction)
        )
        topView.addGestureRecognizer(gesture)
    }
    
    @objc private func tapAction() {
        if !isOpen {
            delegate?.viewWillOpen(self)
        }
        self.isOpen = !isOpen
        topView.backgroundColor = isOpen ? topColor : .white
        UIView.animate(withDuration: 0.4, delay: 0, options: .layoutSubviews) { [weak self] in
            guard let self else { return }
            insertedView.isHidden = !isOpen
            buttonImage.transform = CGAffineTransform(rotationAngle: !isOpen ? 0 : .pi)
        }
    }
    
}

extension FlexibleView: Expandable {
    func forceClose() {
        if isOpen {
            tapAction()
        }
    }
    
    
}

//
//  RegistraionViewController.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 17.10.23.
//

import UIKit
import SnapKit

class RegistraionViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var textField = TextField()
    private lazy var continueButton = BasicButton()
    
    private lazy var imageView: BasicImage = {
        let imageView = BasicImage()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "TheMartRegistrationVc")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        makeConstraints()
    }
    
    private func makeLayout() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(continueButton)
        
        view.addSubview(imageView)
        
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            
            textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            continueButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
    }
    

}

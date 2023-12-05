//
//  RegistraionViewController.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 17.10.23.
//

import UIKit
import SnapKit
import FirebaseAuth
import FirebaseDatabase

class RegistraionViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var emailTextField: TextField = {
        let text = TextField()
        text.textColor = .black
        return text
    }()
    
    private lazy var passwordTextField: TextField = {
        let text = TextField()
        text.textColor = .black
        return text
    }()
    
    private lazy var continueButton: BasicButton = {
        let button = BasicButton()
        return button
    }()
    
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
        if let user = Auth.auth().currentUser?.uid {
            print("user already logged")
        } else {
            print("User not exist in system")
        }
    }
    
    private func makeLayout() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(continueButton)
        
        view.addSubview(imageView)
        
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
            continueButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
    }
    
    @objc func registrationAction() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil,
                  let result
            else {
                print(error!.localizedDescription)
                return
            }
            
            self?.navigationController?.pushViewController(ProfileViewController(.init()), animated: true)
        }
    }
    
    

}

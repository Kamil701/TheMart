//
//  RegistraionViewController.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 17.10.23.
//

import UIKit
import SnapKit
import FirebaseAuth

class RegistraionViewController: UIViewController {
    var vm: ViewModel?
    
    private lazy var mainstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2
        return stack
    }()
    
    private lazy var registerLabel: BasicLabel = {
        let label = BasicLabel(text: "Хотите зарегистрироваться?")
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var emailInput = BasicTextField(style: .forEmail)
    private lazy var passwordInput = BasicTextField(style: .forPassword)
    
    private lazy var signInButton: BasicButton = {
        let button = BasicButton(style: .registration)
        button.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var logInButton: BasicButton = {
        let button = BasicButton(style: .login)
        button.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
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
        
        navigationController?.navigationBar.barTintColor = .black
        
        if let user = Auth.auth().currentUser?.uid {
            print("user already logged")
        } else {
            print("User not exist in system")
        }
        
    }
    
    private func makeLayout() {
        view.addSubview(mainstackView)
        
        mainstackView.addArrangedSubview(emailInput)
        mainstackView.addArrangedSubview(passwordInput)
        mainstackView.addArrangedSubview(logInButton)
        
        mainstackView.addArrangedSubview(labelStack)
        labelStack.addArrangedSubview(registerLabel)
        labelStack.addArrangedSubview(signInButton)
        
        view.addSubview(imageView)
        
    }
    
    private func makeConstraints() {
        mainstackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            
            emailInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
            passwordInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
            signInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            logInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            
        }
    }
    
    @objc private func signInAction() {
        navigationController?.present(NavigatedRegistrVC(), animated: true)
    }
    
    @objc private func logInAction() {
        guard let email = emailInput.text,
              let password = passwordInput.text
        else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil,
                  let result
            else {
                print(error!.localizedDescription)
                return
            }
        }
        
    }
    

}

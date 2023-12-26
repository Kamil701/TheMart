//
//  NavigatedRegistrVC.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 7.12.23.
//

import UIKit
import SnapKit
import FirebaseAuth

class NavigatedRegistrVC: UIViewController {
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    private lazy var datePickerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var nameInput = BasicTextField(style: .forName)
    private lazy var surnameInput = BasicTextField(style: .forSurname)
    private lazy var emailInput = BasicTextField(style: .forEmailRegVC)
    private lazy var passwordInput = BasicTextField(style: .forPassword)
    private lazy var phoneNumberInput = BasicTextField(style: .phoneNumber)
    
    private lazy var emailLabel = BasicLabel(alignment: .left, text: "Введите Email", style: .forRegistrationVC)
    private lazy var nameLabel = BasicLabel(alignment: .left, text: "Имя", style: .forRegistrationVC)
    private lazy var surnameLabel = BasicLabel(alignment: .left, text: "Фамилия", style: .forRegistrationVC)
    private lazy var passwordLabel = BasicLabel(alignment: .left, text: "Придумайте пароль", style: .forRegistrationVC)
    private lazy var phoneNumberLabel = BasicLabel(alignment: .left, text: "Введите номер телефона", style: .forRegistrationVC)
    private lazy var dateOfBirthLabel = BasicLabel(alignment: .left, text: "Введите дату рождения:", style: .forRegistrationVC)
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    private lazy var createAccountButton: BasicButton = {
        let button = BasicButton(style: .presentedRegistrationVC)
        button.addTarget(
            self,
            action: #selector(createAccount),
            for: .touchUpInside)
        return button
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
        view.backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(nameLabel)
        mainStackView.addArrangedSubview(nameInput)
        mainStackView.addArrangedSubview(surnameLabel)
        mainStackView.addArrangedSubview(surnameInput)
        mainStackView.addArrangedSubview(phoneNumberLabel)
        mainStackView.addArrangedSubview(phoneNumberInput)
        mainStackView.addArrangedSubview(emailLabel)
        mainStackView.addArrangedSubview(emailInput)
        mainStackView.addArrangedSubview(passwordLabel)
        mainStackView.addArrangedSubview(passwordInput)
        
        view.addSubview(datePickerStackView)
        datePickerStackView.addArrangedSubview(dateOfBirthLabel)
        datePickerStackView.addArrangedSubview(datePicker)
        
        view.addSubview(createAccountButton)
    }
    
    private func makeConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            
            emailInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
            nameInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
            passwordInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
            surnameInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
            phoneNumberInput.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        datePickerStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalTo(mainStackView.snp.bottom).offset(15)
        }
        
        createAccountButton.snp.makeConstraints { make in
            make.top.equalTo(datePickerStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            createAccountButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
    }
    
    @objc private func createAccount() {
        guard let email = emailInput.text,
              let password = passwordInput.text,
              let user = Auth.auth().currentUser
        else { return }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil,
                  let result
            else {
                print(error!.localizedDescription)
                return
            }
        }
    }
    
}

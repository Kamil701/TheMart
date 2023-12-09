//
//  BasicTextField.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 17.10.23.
//

import UIKit
import Combine

class BasicTextField: UITextField {
    var cancellables: Set<AnyCancellable> = []
    
    init(style: Style = .forEmail) {
        super.init(frame: .zero)
        setStyle(style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .forAge:
            self.layer.cornerRadius = 8
            self.leftViewMode = .always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            self.backgroundColor = .white
            self.textColor = .black
            self.layer.masksToBounds = true
            
        case .forEmail:
            self.layer.cornerRadius = 8
            self.leftViewMode = .always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            self.backgroundColor = .white
            self.placeholder = "Введите email"
            self.textColor = .black
            self.layer.masksToBounds = true
            
        case .forName:
            self.layer.cornerRadius = 8
            self.leftViewMode = .always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            self.backgroundColor = .white
            self.textColor = .black
            self.layer.masksToBounds = true
            
        case .forPassword:
            self.layer.cornerRadius = 8
            self.leftViewMode = .always
            self.placeholder = "Введите пароль"
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            self.backgroundColor = .white
            self.textColor = .black
            self.isSecureTextEntry = true
            self.layer.masksToBounds = true
            
        case .forSurname:
            self.layer.cornerRadius = 8
            self.leftViewMode = .always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            self.backgroundColor = .white
            self.textColor = .black
            self.layer.masksToBounds = true
            
        case .phoneNumber:
            self.layer.cornerRadius = 8
            self.leftViewMode = .always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            self.backgroundColor = .white
            self.textColor = .black
            self.layer.masksToBounds = true
            
        case .forEmailRegVC:
            self.layer.cornerRadius = 8
            self.leftViewMode = .always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            self.backgroundColor = .white
            self.textColor = .black
            self.layer.masksToBounds = true
            
        case .forPasswordRegVC:
            self.layer.cornerRadius = 8
            self.leftViewMode = .always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
            self.backgroundColor = .white
            self.isSecureTextEntry = true
            self.textColor = .black
            self.layer.masksToBounds = true
        }
    }
    
    func setViewModel(_ viewModel: ViewModel) {
        viewModel.$text.sink { [weak self] text in
            self?.text = text
        }
        .store(in: &cancellables)
    }
}

extension BasicTextField {
    enum Style{
        case forEmail
        case forPassword
        case forName
        case forSurname
        case forAge
        case phoneNumber
        case forEmailRegVC
        case forPasswordRegVC
    }
}

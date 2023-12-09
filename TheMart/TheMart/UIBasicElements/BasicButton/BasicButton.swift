//
//  BasicButton.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 18.10.23.
//

import UIKit
import SnapKit
import Combine

class BasicButton: UIButton {
    private var cancellables: Set<AnyCancellable> = []
    
    weak var vm: ViewModel?
    
    init(style: Style = .registration, animatedStyle: Animation = .registrationVC) {
        super.init(frame: .zero)
        setStyle(style)
        initButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initButton() {
        self.addTarget(
            self,
            action: #selector(tapAction),
            for: .touchUpInside
        )
    }
    
    func setViewModel(vm: ViewModel) {
        self.vm = vm
        
        vm.$isEnabled.sink { [weak self] value in
            self?.isEnabled = value
        }
        .store(in: &cancellables)
        
        vm.$title.sink { [weak self] title in
            switch title {
            case .text(let text):
                self?.setTitle(text, for: .normal)
                
            case .attributed(let attributed):
                self?.titleLabel?.attributedText = attributed
            }
        }
        .store(in: &cancellables)
        
    }
    
    @objc private func tapAction() {
        vm?.action
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .registration:
            self.setTitle("Зарегистрироваться", for: .normal)
            self.backgroundColor = .clear // Прозрачный фон
            self.setTitleColor(UIColor(red: 255/255, green: 196/255, blue: 45/255, alpha: 1.0), for: .normal)
            self.setTitleColor(.white, for: .highlighted)
        
        case .login:
            self.setTitle("Войти", for: .normal)
            self.layer.cornerRadius = 8 
            self.backgroundColor = UIColor(red: 255/255, green: 196/255, blue: 45/255, alpha: 1.0)
            self.setTitleColor(.black, for: .normal)
            self.setTitleColor(.white, for: .highlighted)
            
        case .chooseObject:
            self.setTitle("Зарегистрироваться", for: .normal)
            self.layer.cornerRadius = 8
            self.setTitleColor(.black, for: .normal)
            self.backgroundColor = .systemYellow.withAlphaComponent(30)
            
        case .presentedRegistrationVC:
            self.setTitle("Зарегистрироваться", for: .normal)
            self.backgroundColor = .white // Прозрачный фон
            self.setTitleColor(UIColor(red: 255/255, green: 196/255, blue: 45/255, alpha: 1.0), for: .normal)
            self.layer.cornerRadius = 8
            self.layer.masksToBounds = true
            self.setTitleColor(.white, for: .highlighted)
        }
    }
}

extension BasicButton {
    enum Style {
        case registration
        case login
        case chooseObject
        case presentedRegistrationVC
    }
}

extension BasicButton{
    enum Animation {
        case registrationVC
        case loginVC
    }
}

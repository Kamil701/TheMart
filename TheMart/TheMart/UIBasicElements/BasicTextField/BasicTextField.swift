//
//  BasicTextField.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 17.10.23.
//

import UIKit
import Combine

class TextField: UITextField {
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        super.init(frame: .zero)
        makeLayout()
        makeConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 8
        textField.placeholder = "Номер телефона"
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.backgroundColor = .white
        textField.textColor = .white
        textField.layer.masksToBounds = true
        return textField
    }()
    
    func setViewModel(_ viewModel: ViewModel) {
        viewModel.$text.sink { [weak self] text in
            self?.text = text
        }
        .store(in: &cancellables)
    }
    
    private func makeLayout() {
        self.addSubview(phoneNumberTextField)
    }
    
    private func makeConstraints() {
        phoneNumberTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}

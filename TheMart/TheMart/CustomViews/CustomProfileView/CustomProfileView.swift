//
//  CustomProfileView.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 15.12.23.
//

import UIKit
import SnapKit

class CustomProfileView: UIView {
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var hiLabel = BasicLabel(text: "Hi", style: .hiforProfileView)
    private lazy var nameLabel = BasicLabel(style: .nameLabel)
    private lazy var surnameLabel = BasicLabel(style: .surnameLabel)
    private lazy var phoneNumberLabel = BasicLabel(style: .phoneNumberLabel)
    private lazy var dateOfBirthLabel = BasicLabel(style: .dateofBirthLabel)
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor(red: 255/255, green: 196/255, blue: 45/255, alpha: 1.0)
        self.layer.masksToBounds = true
        makeLayout()
        makeConstraints()
    }
    
    private func makeLayout() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(hiLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(surnameLabel)
        self.addSubview(phoneNumberLabel)
        self.addSubview(dateOfBirthLabel)
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        
        dateOfBirthLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(40)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.bottom.equalTo(dateOfBirthLabel.snp.top).offset(40)
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    func setViewModel(vm: ViewModel) {
        self.nameLabel.setViewModel(vm.nameLabelVM)
        self.surnameLabel.setViewModel(vm.surnameLabelVM)
        self.phoneNumberLabel.setViewModel(vm.phoneNumberLabelVM)
    }
    
    func setInfo(user: User) {
        self.nameLabel.text = user.name
        self.surnameLabel.text = user.surname
        self.phoneNumberLabel.text = user.phoneNumber
        self.dateOfBirthLabel.text = user.dateOfBirth
    }
    
    
    
    
}

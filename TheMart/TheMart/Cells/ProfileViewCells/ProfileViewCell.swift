//
//  ProfileViewCell.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 9.12.23.
//

import UIKit
import SnapKit

class ProfileViewCell: UIView {
    
    var user: User?
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        stack.spacing = 5
        return stack
    }()
    
    private var nameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        stack.alignment = .center
        return stack
    }()
    
    lazy var nameLabel = BasicLabel(
        alignment: .left,
        style: .forRegistrationVC)
    
    lazy var surnameLabel = BasicLabel(
        alignment: .left,
        style: .forRegistrationVC)
    
    lazy var phoneNumberLabel = BasicLabel(
        alignment: .left,
        style: .forRegistrationVC)
    
    
    lazy var dateofBirthLabel = BasicLabel(
        alignment: .left,
        style: .forRegistrationVC)
    
    lazy var purchaseAmountLabel = BasicLabel(
        alignment: .left,
        style: .forRegistrationVC)
    
    
    lazy var cashbackLabel = BasicLabel(
        alignment: .left,
        style: .forRegistrationVC)
    
    
    lazy var accumulationLabel = BasicLabel(
        alignment: .left,
        style: .forRegistrationVC)
    
    init() {
        super.init(frame: .zero)
        makeLayout()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeLayout() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(nameStack)
        nameStack.addArrangedSubview(nameLabel)
        nameStack.addArrangedSubview(surnameLabel)
        stackView.addArrangedSubview(phoneNumberLabel)
        stackView.addArrangedSubview(dateofBirthLabel)
        self.addSubview(purchaseAmountLabel)
        self.addSubview(cashbackLabel)
        self.addSubview(accumulationLabel)
    }
    
    private func makeConstraints() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(220)
        }
        
        purchaseAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            purchaseAmountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        cashbackLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            cashbackLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        accumulationLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            accumulationLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
    }
    
    func setViewModel(_ vm: ViewModel) {
        self.nameLabel.setViewModel(vm.nameLabelVM)
        self.surnameLabel.setViewModel(vm.surnameLabelVM)
        self.phoneNumberLabel.setViewModel(vm.phoneNumberLabelVM)
        self.dateofBirthLabel.setViewModel(vm.dateOfBirthLabelVM)
        self.purchaseAmountLabel.setViewModel(vm.purchaseAmountLabelVM)
        self.cashbackLabel.setViewModel(vm.cashBackLabelVM)
        self.accumulationLabel.setViewModel(vm.accumulationLabelVM)
    }
    
    func setInfo(user: User) {
        nameLabel.text = user.name
        surnameLabel.text = user.surname
        phoneNumberLabel.text = user.phoneNumber
        dateofBirthLabel.text = user.dateOfBirth
        purchaseAmountLabel.text = user.purchaseAmount
        cashbackLabel.text = user.cashBack
        accumulationLabel.text = user.accumulation
    }
    
}

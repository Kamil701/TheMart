//
//  ProfileFlexibleView .swift
//  TheMart
//
//  Created by Kamil Vakhobov on 16.11.23.
//

import UIKit
import SnapKit

class ProfileFlexibleView: UIView {
    
    init() {
        super.init(frame: .zero)
        makeLayout()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var emojiStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var infoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var profileEmoji: BasicLabel = {
        let label = BasicLabel()
        label.text = "💁‍♂️"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var phoneNumberEmoji: BasicLabel = {
        let label = BasicLabel()
        label.text = "☎️"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var dateOfBirthEmoji: BasicLabel = {
        let label = BasicLabel()
        label.text = "📆"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var nameLabel: BasicLabel = {
        let label = BasicLabel()
        label.text = "Bob Hulias"
        label.font = UIFont(name: "OpenSans-Italic-VariableFont_wdth,wght", size: 15)
        return label
    }()
    
    private lazy var phoneNumberLabel: BasicLabel = {
        let label = BasicLabel()
        label.text = "+998909793033"
        label.font = UIFont(name: "OpenSans-Italic-VariableFont_wdth,wght", size: 15)
        return label
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Italic-VariableFont_wdth,wght", size: 15)
        return label
    }()
    
    lazy var buttonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        return imageView
    }()
    
    private func makeLayout() {
        self.addSubview(emojiStack)
        
        emojiStack.addArrangedSubview(profileEmoji)
        emojiStack.addArrangedSubview(phoneNumberEmoji)
        emojiStack.addArrangedSubview(dateOfBirthEmoji)
        
        self.addSubview(infoStack)
        
        infoStack.addArrangedSubview(nameLabel)
        infoStack.addArrangedSubview(phoneNumberLabel)
        infoStack.addArrangedSubview(datePicker)
    }
    
    private func makeConstraints() {
        emojiStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.bottom.equalToSuperview()
        }
        
        infoStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
    }
}


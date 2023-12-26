//
//  BasicLabel.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 17.10.23.
//

import UIKit
import Combine

class BasicLabel: UILabel {
    var cancellables: Set<AnyCancellable> = []
    
    init(alignment: NSTextAlignment = .left, text: String? = nil, style: Style = .forRegistrationVC) {
        super.init(frame: .zero)
        self.textAlignment = alignment
        setStyle(style)
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .forRegistrationVC:
            self.font = .boldSystemFont(ofSize: 17)
            self.textColor = UIColor(red: 255/255, green: 196/255, blue: 45/255, alpha: 1.0)
        case .hiforProfileView:
            self.font = .boldSystemFont(ofSize: 20)
            self.textColor = .white
        case .nameLabel:
            self.font = .boldSystemFont(ofSize: 20)
            self.textColor = .white
        case .surnameLabel:
            self.font = .boldSystemFont(ofSize: 20)
            self.textColor = .white
        case .phoneNumberLabel:
            self.font = .systemFont(ofSize: 15)
            self.textColor = .white
        case .dateofBirthLabel:
            self.font = .systemFont(ofSize: 15)
            self.textColor = .white
        }
        
    }
    
    func setViewModel(_ viewModel: ViewModel) {
        viewModel.$text.sink { [weak self] text in
            self?.text = text
        }
        .store(in: &cancellables)
    }
    
}
extension BasicLabel {
    enum Style {
        case forRegistrationVC
        case hiforProfileView
        case nameLabel
        case surnameLabel
        case phoneNumberLabel
        case dateofBirthLabel
    }
}

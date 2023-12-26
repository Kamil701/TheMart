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
    
<<<<<<< HEAD
   
    init() {
=======
    init(alignment: NSTextAlignment = .left, text: String, style: Style = .forRegistrationVC) {
>>>>>>> parent of cb2d5ab (commit_changes)
        super.init(frame: .zero)
//        self.textAlignment = alignment
//        setStyle(style)
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
<<<<<<< HEAD
    private func setStyle() {
//        switch style {
//        case .forRegistrationVC:
//            self.font = .boldSystemFont(ofSize: 15)
//            self.textColor = UIColor(red: 255/255, green: 196/255, blue: 45/255, alpha: 1.0)
//        }
=======
    private func setStyle(_ style: Style) {
        switch style {
        case .forRegistrationVC:
            self.font = .boldSystemFont(ofSize: 15)
            self.textColor = UIColor(red: 255/255, green: 196/255, blue: 45/255, alpha: 1.0)
        }
>>>>>>> parent of cb2d5ab (commit_changes)
    }
    

    func setViewModel(_ viewModel: ViewModel) {
        viewModel.$text.sink { [weak self] text in
            self?.text = text
        }
        .store(in: &cancellables)
    }
    
}
<<<<<<< HEAD
//extension BasicLabel {
//    enum Style {
//        case forRegistrationVC
//    }
//}
=======
extension BasicLabel {
    enum Style {
        case forRegistrationVC
    }
}
>>>>>>> parent of cb2d5ab (commit_changes)

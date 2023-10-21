//
//  BasicButton.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 18.10.23.
//

import UIKit
import SnapKit

class BasicButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        makeLayout()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
                         
    @objc private func buttonTapped() {
        UIView.animate(withDuration: 0.5) {
            self.button.backgroundColor = .gray
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.2, animations: {
            self.button.backgroundColor = .white
        })
    }
    
    private func makeLayout() {
        self.addSubview(button)
    }
    
    private func makeConstraints() {
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

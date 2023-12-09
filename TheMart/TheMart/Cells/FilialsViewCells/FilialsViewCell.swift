//
//  FilialsViewCell.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 18.10.23.
//

import UIKit
import SnapKit

class FilialsView: UIView {
    
    init() {
        super.init(frame: .zero)
        makeLayout()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var filialsLabel: BasicLabel = {
        let label = BasicLabel(text: "")
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true
        label.font = .monospacedSystemFont(ofSize: 12, weight: UIFont.Weight.light)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chevronRight")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func makeLayout() {
        self.addSubview(filialsLabel)
        self.addSubview(imageView)
    }
    
    private func makeConstraints() {
        filialsLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        filialsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        imageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalTo(filialsLabel.snp.centerY)
            make.height.width.equalTo(20)
        }
    }
    
    func setViewModel(_ viewModel: ViewModel) {
        self.filialsLabel.setViewModel(viewModel.filialsName)
    }
    
    
}



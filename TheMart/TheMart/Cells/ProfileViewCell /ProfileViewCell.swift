//
//  ProfileViewCell.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 14.11.23.
//

import UIKit
import SnapKit

class ProfileViewCell: UIView {
    
    private lazy var flexibleView = FlexibleView<ProfileFlexibleView>(text: "Profile Information")
    
    private lazy var informationLabel: BasicLabel = {
        let label = BasicLabel()
        label.font = UIFont(name: "OpenSans-Italic-VariableFont_wdth,wght", size: 15)
        label.textColor = UIColor(red: 50/255.0, green: 52/255.0, blue: 52/255.0, alpha: 1.0)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .black
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        makeLayout()
        makeConstraints()
        flexibleView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeLayout() {
        self.addSubview(informationLabel)
        self.addSubview(imageView)
        self.addSubview(flexibleView)
    }
    
    private func makeConstraints() {
//        informationLabel.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().offset(8)
//        }
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalTo(informationLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-8)
//            make.height.width.equalTo(10)
        }
        
        flexibleView.insertedView.snp.makeConstraints { make in
            make.height.width.equalTo(140)
        }
        
        flexibleView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
    func setViewModel(_ viewModel: ViewModel) {
        self.informationLabel.setViewModel(viewModel.informationLabelVM)
    }
    
}

extension ProfileViewCell: FlexibleViewDelegate {
    func viewWillOpen(_ flexibleView: UIView) {
        let closable = self.subviews.filter({ $0 is Expandable && $0 != flexibleView }) as? [Expandable]
        closable?.forEach({ $0.forceClose() })
    }
}

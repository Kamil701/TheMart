//
//  BasicImage.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 18.10.23.
//

import UIKit
import SnapKit

class BasicImage: UIImageView {
    
    init() {
        super.init(frame: .zero)
        makeLayout()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private func makeLayout() {
        self.addSubview(imageView)
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

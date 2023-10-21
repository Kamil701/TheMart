//
//  BasicTableViewCell.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 19.10.23.
//

import UIKit
import SnapKit

class BasicTableViewCell<T:UIView>: UITableViewCell {
    let builtCell = T()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        makeLayout()
        makeConstraints()
    }
    
    private func makeLayout() {
        self.contentView.addSubview(builtCell)
    }
    
    private func makeConstraints() {
        builtCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

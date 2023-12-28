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
    func setViewModel(_ viewModel: ViewModel) {
        viewModel.$text.sink { [weak self] text in
            self?.text = text
        }
        .store(in: &cancellables)
    }
}

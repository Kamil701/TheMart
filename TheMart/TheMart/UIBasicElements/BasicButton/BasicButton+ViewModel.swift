//
//  BasicButton+ViewModel.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 18.10.23.
//

import Foundation

typealias Completion = () -> Void

extension BasicButton {
    final class ViewModel {
        @Published var isEnabled: Bool = true
        @Published var title: TextValue
        var action: Completion?
        
        init(title: TextValue) {
            self.title = title
        }
        
        
    }
}

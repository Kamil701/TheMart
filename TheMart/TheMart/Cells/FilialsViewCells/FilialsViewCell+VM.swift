//
//  FilialsViewCell+VM.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 18.10.23.
//

import Foundation

extension FilialsView {
    final class ViewModel {
        let filialsName = BasicLabel.ViewModel()
        
        init(filialsName: FilialModel) {
            self.filialsName.text = filialsName.filial
        }
        
    }
}

//
//  ProfileViewCell+ViewModel .swift
//  TheMart
//
//  Created by Kamil Vakhobov on 14.11.23.
//

import Foundation

extension ProfileViewCell {
    final class ViewModel {
        let informationLabelVM = BasicLabel.ViewModel()
        
        init(info: ProfileModel) {
            self.informationLabelVM.text = info.data
        }
    }
}

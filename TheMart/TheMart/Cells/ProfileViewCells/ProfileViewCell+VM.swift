//
//  ProfileViewCell+VM.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 9.12.23.
//

import Foundation

extension ProfileViewCell {
    final class ViewModel {
        let nameLabelVM = BasicLabel.ViewModel()
        let surnameLabelVM = BasicLabel.ViewModel()
        let phoneNumberLabelVM = BasicLabel.ViewModel()
        let dateOfBirthLabelVM = BasicLabel.ViewModel()
        let purchaseAmountLabelVM = BasicLabel.ViewModel()
        let cashBackLabelVM = BasicLabel.ViewModel()
        let accumulationLabelVM = BasicLabel.ViewModel()
    }
}

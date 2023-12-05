//
//  ProfileVC+VM.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 14.11.23.
//

import Foundation

extension ProfileViewController {
    final class ViewModel {
        @Published var infoLabelVM: [ProfileViewCell.ViewModel] = []
        
        func setInformation() {
            let profileInformation = ProfileModel(data: "Информация профиля")
            let systemOfLoyalty = ProfileModel(data: "Система лояльности")
            let support = ProfileModel(data: "Поддержка")
            let aboutApp = ProfileModel(data: "О приложении")
            let nightTheme = ProfileModel(data: "Переключиться на ночную тему")
            
            self.infoLabelVM = [
                ProfileViewCell.ViewModel(info: profileInformation),
                ProfileViewCell.ViewModel(info: systemOfLoyalty),
                ProfileViewCell.ViewModel(info: support),
                ProfileViewCell.ViewModel(info: aboutApp),
                ProfileViewCell.ViewModel(info: nightTheme)
            ]
        }
    }
}

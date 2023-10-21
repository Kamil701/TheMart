//
//  FilialsVC+VM.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 18.10.23.
//

import Foundation


extension FilialsViewController {
    final class ViewModel {
        
        @Published var filialVC: [FilialsView.ViewModel] = []

        func setFilials() {
            // Создаем экземпляры FilialModel
            let filial1 = FilialModel(filial: "  Яшнабадский район")
            let filial2 = FilialModel(filial: "  Мирабадский район")
            let filial3 = FilialModel(filial: "  Алмазарский район")
            let filial4 = FilialModel(filial: "  Якасарайский район")
            let filial5 = FilialModel(filial: "  Юнусабаский район")
            let filial6 = FilialModel(filial: "  Чиланзарский район")

            // Преобразуем их в экземпляры FilialsView.ViewModel и добавляем в массив
            self.filialVC = [
                FilialsView.ViewModel(filialsName: filial1),
                FilialsView.ViewModel(filialsName: filial2),
                FilialsView.ViewModel(filialsName: filial3),
                FilialsView.ViewModel(filialsName: filial4),
                FilialsView.ViewModel(filialsName: filial5),
                FilialsView.ViewModel(filialsName: filial6)
            ]
        }
        
    }
}

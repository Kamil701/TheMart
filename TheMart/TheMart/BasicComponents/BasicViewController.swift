//
//  BasicViewController.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 19.10.23.
//

import UIKit
import Combine

class BasicViewController: UIViewController {
    var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        makeConstraints()
        title = "Районы"
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLayout() {
    }
    
    func makeConstraints() {}
    
    func binding() {}

}

//
//  FilialsViewController.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 18.10.23.
//

import UIKit
import SnapKit
import Combine

typealias CustomCell = BasicTableViewCell<FilialsView>

class FilialsViewController: BasicViewController {
    
    var viewModel: ViewModel
    
    init(_ viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGray4
        tableView.separatorStyle = .none
        tableView.register(CustomCell.self, forCellReuseIdentifier: String(describing: CustomCell.self))
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setFilials()
    }
    
    override func makeLayout() {
        view.addSubview(tableView)
        view.backgroundColor = .systemGray4
    }
    
    override func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.height.equalTo(340)
        }
    }
    
    override func binding() {
        viewModel.$filialVC.sink { [weak self] filial in
            self?.tableView.reloadData()
        }
        .store(in: &cancellables)
    }
    

}

extension FilialsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filialVC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CustomCell.self), for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = .systemGray4
        guard let newCell = cell as? CustomCell else { return UITableViewCell() }
        let filial = viewModel.filialVC[indexPath.row]
        newCell.builtCell.setViewModel(filial)
        return newCell
    }
    
    
}

extension FilialsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

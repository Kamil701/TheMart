//
//  ProfileViewController.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 14.11.23.
//

import UIKit
import SnapKit

typealias ProfileView = BasicTableViewCell<ProfileViewCell>
class ProfileViewController: BasicViewController {
    
    private lazy var flexibleView = FlexibleView<ProfileFlexibleView>(text: "Информация о профиле")
    
    var vm: ViewModel
    
    init(_ vm: ViewModel) {
        self.vm = vm
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.setInformation()
        view.backgroundColor = .white
        
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileView.self, forCellReuseIdentifier: String(describing: ProfileView.self))
        tableView.layer.cornerRadius = 12
        tableView.layer.masksToBounds = true
        tableView.backgroundColor = UIColor.lightGray
        tableView.scrollsToTop = false
        return tableView
    }()
    
    override func makeLayout() {
        view.addSubview(tableView)
        //self.view.addSubview(flexibleView)
    }
    
    override func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(300)
        }
        
//        flexibleView.insertedView.snp.makeConstraints { make in
//            make.height.width.equalTo(140)
//        }
        
//        flexibleView.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview()
//            make.top.equalTo(tableView.snp.bottom).offset(20)
//
//        }
    }
    


}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.infoLabelVM.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileView.self), for: indexPath)
        cell.selectionStyle = .none
        cell.layoutMargins = .zero
        cell.separatorInset = .zero
        cell.preservesSuperviewLayoutMargins = false
        guard let newCell = cell as? ProfileView else { return UITableViewCell()}
        newCell.builtCell.setViewModel(vm.infoLabelVM[indexPath.row])
        return newCell
    }


}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ProfileViewController: FlexibleViewDelegate {
    func viewWillOpen(_ flexibleView: UIView) {
        let closable = self.view.subviews.filter({ $0 is Expandable && $0 != flexibleView }) as? [Expandable]
        closable?.forEach({ $0.forceClose() })
    }
}


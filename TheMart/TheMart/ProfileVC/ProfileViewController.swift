//
//  ProfileViewController.swift
//  TheMart
//
//  Created by Kamil Vakhobov on 9.12.23.
//

import UIKit
import SnapKit
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    private typealias UserInfo = BasicTableViewCell<ProfileViewCell>
    
    private lazy var topView = CustomProfileView()
    
    private var userInfo: [User] = []
    
    private var user: User?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserInfo.self, forCellReuseIdentifier: String(describing: UserInfo.self))
        tableView.layer.cornerRadius = 8
        tableView.layer.masksToBounds = true
        tableView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        makeConstraints()
        view.backgroundColor = .white
    }
    
    private func makeLayout() {
        view.addSubview(tableView)
        view.addSubview(topView)
    }
    
    private func makeConstraints() {
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(100)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(-20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(500)
            make.width.equalTo(250)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getInfo()
    }
    
    private func parseData(_ dict: [String: Any]) {
        userInfo.removeAll()
        for (key, value) in dict {
            guard let answer = value as? [String: Any] else { continue }
            guard let edit = try? User(key: key, dict: answer) else { continue }
            self.userInfo.append(edit)
        }
        self.tableView.reloadData()
    }
    
    private func getInfo() {
        guard let user = Auth.auth().currentUser else { return }
        Environment.ref.child("users/\(user.uid)/userinfo").observeSingleEvent(of: .value) { [weak self] snapshot in
            guard let userInfoDict = (snapshot.value as? [String: Any]) else { return }
            self?.parseData(userInfoDict)
            
        }
    }


}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserInfo.self), for: indexPath) as? UserInfo else { return .init()}
        return cell
    }
    
}

extension ProfileViewController: UITableViewDelegate {
   

}


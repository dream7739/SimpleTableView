//
//  SettingTableViewController.swift
//  SimpleTableView
//
//  Created by 홍정민 on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    private let settingTitle = [["공지사항", "실험실", "버전정보"],
    ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
    
    private let settingSectionTitle = ["전체설정", "개인 설정", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingSectionTitle[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settingSectionTitle.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTitle[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        cell.textLabel?.text = settingTitle[indexPath.section][indexPath.row]
        return cell
    }
 

}

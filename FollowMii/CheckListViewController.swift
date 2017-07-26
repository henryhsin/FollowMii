//
//  CheckListViewController.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/22.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit

class CheckListViewController: UIViewController {
    var checkListSet = CheckLists()
    var banner: CheckList?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let banner = banner else{
            return
        }
        checkListSet.addNewList(checkList: banner)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        checkLists.append(checkList1)
//        checkLists.append(checkList2)
//        checkLists.append(checkList3)
//        checkLists.append(checkList4)
//        checkLists.append(checkList5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CheckListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkListSet.checkLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CheckListTableViewCell
        let checkList = checkListSet.checkLists[indexPath.row]
        cell.configureCell(checkList: checkList)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            checkListSet.checkLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension CheckListViewController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

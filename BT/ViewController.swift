//
//  ViewController.swift
//  BT
//
//  Created by Mahima Personal on 08/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dataTable: UITableView!
    
    var index: Int = 0 
    var values: [DataValue] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dataTable.dataSource = self
        dataTable.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if values.isEmpty {
            getInfo(for: index + 1)
        }
    }
    func getInfo(for index: Int) {
        NetworkManager().getData(pageNum: index) { completeData in
            DispatchQueue.main.async {
                self.values = completeData.data ?? []
                self.dataTable.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as? DataCell else {return UITableViewCell()}
        cell.setupCell(with: values[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
}




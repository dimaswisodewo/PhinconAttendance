//
//  HistoryViewController.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

class HistoryViewController: UIViewController {

    static let identifier = "HistoryViewController"
    
    @IBOutlet weak var historyTableView: UITableView! {
        didSet {
            historyTableView.delegate = self
            historyTableView.dataSource = self
            historyTableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.shared.dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = historyTableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier) as? HistoryTableViewCell else {
            print("Gagal ambil cell")
            return UITableViewCell()
        }
        
        cell.configure(with: DummyData.shared.dummy[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        historyTableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else {
            return
        }
        
        let model = DummyData.shared.dummy[indexPath.row]
        vc.configure(model)
        vc.navigationItem.title = model.subtitle
        
        vc.printReversedNameFromMethod() // Panggil method
        printNameWithEmoticonFromFunction(name: model.title) // Panggil function
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

//
//  ShopView.swift
//  Practic
//
//  Created by surexnx on 17.10.2023.
//

import UIKit

class ShopView: UIView, UITableViewDelegate{

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .singleLine
        view.estimatedRowHeight = 120
        view.translatesAutoresizingMaskIntoConstraints = false

        view.delegate = self
        view.register(CarsTableViewCell.self, forCellReuseIdentifier: CarsTableViewCell.reuseIdentifier)
        return view
    }()
    
    weak var controller: ShopViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        addSubview(tableView)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func setTableDataSource(_ dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

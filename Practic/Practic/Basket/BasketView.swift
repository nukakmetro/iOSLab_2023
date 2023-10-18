//
//  BasketView.swift
//  Practic
//
//  Created by surexnx on 17.10.2023.
//

import UIKit

class BasketView: UIView {

    lazy var tableView: UITableView = {
        
        let view = UITableView()
        
        view.separatorStyle = .singleLine
        view.estimatedRowHeight = 120
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.register(CarsinTheBasketTableViewCell.self, forCellReuseIdentifier: CarsinTheBasketTableViewCell.reuseIdentifier)
        
        return view
    }()
    
    lazy var notificationLabel: UILabel = {
        
        var label = UILabel()
        
        label.text = "Что бы корзина не была пустой нужно добавить товар"
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    
    
    
    weak var controller: BasketViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(tableView)
        addSubview(notificationLabel)
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
            
            notificationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            notificationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            notificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

}

extension BasketView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

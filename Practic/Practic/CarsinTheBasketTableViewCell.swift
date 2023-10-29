import UIKit

protocol CarCellDelegate: AnyObject {
    func didPressRemoveAll()
}

class CarsinTheBasketTableViewCell: UITableViewCell {

    let carsImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let priceLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var numLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    override func prepareForReuse() {
            super.prepareForReuse()
            
            carsImage.image = nil
        }
        
    lazy var addButton:UIButton = {
        
        let action = UIAction{_ in
            self.addButtonTaped!()
        }
        
        let button = UIButton(primaryAction: action)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     lazy var buttonMinus: UIButton = {
        
            let action = UIAction{_ in
                self.minusButtonTapped!()
            }
            
        let button = UIButton(primaryAction: action)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(systemName: "minus.circle"), for: .normal)
            return button
        }()
    
    var minusButtonTapped: (() -> Void)?
    
    var addButtonTaped: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with car: Car){
        carsImage.image = car.Image
        nameLabel.text = car.name
        priceLabel.text = car.price
        numLabel.text = String(car.num)
    }
}

extension CarsinTheBasketTableViewCell{
    
    private func addSubviews(_ view: UIView...) {
        view.forEach{contentView.addSubview($0)}
    }
    
    private func setupLayout(){
        
        guard carsImage.superview == nil else { return }
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let numStackView = UIStackView(arrangedSubviews: [buttonMinus, numLabel, addButton])
        numStackView.axis = .horizontal
        numStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(carsImage, stackView, numStackView)
        
        NSLayoutConstraint.activate([
            
            carsImage.widthAnchor.constraint(equalToConstant: 80),
            carsImage.heightAnchor.constraint(equalToConstant: 80),
            carsImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            carsImage.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            carsImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            stackView.leadingAnchor.constraint(equalTo: carsImage.trailingAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            
            
            numStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            numStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    static var reuseIdentifier: String{
        return String(describing: self)
    }
    
}

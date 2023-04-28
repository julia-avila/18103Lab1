//
//  TableViewCell.swift
//  lab1
//
//  Created by Julia Avila on 4/28/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    let restaurantLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
            contentView.addSubview(stackView)
            stackView.addArrangedSubview(myImageView)
            stackView.addArrangedSubview(restaurantLabel)

            let constraints = [
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ]
            NSLayoutConstraint.activate(constraints)
            
            let verticalSpace = NSLayoutConstraint(item: restaurantLabel, attribute: .top, relatedBy: .equal, toItem: myImageView, attribute: .bottom, multiplier: 1, constant: 10)
            NSLayoutConstraint.activate([verticalSpace])
        }
}

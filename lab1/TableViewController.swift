//
//  TableViewController.swift
//  lab1
//
//  Created by Julia Avila on 2/22/23.
//

import UIKit

struct Restaurant {
    let imageName: String
    let name: String
}

class TableViewController: UITableViewController {
    
    private static let cellReuseIdentifier = "thisCanBeAnythingReally"
    
    var restaurants = [
        Restaurant(imageName: "jollibeeImage", name: "Jolibee"),
        Restaurant(imageName: "mcdoPic", name: "McDonald's"),
        Restaurant(imageName: "Wendys", name: "Wendy's"),
        Restaurant(imageName: "tacoBelll", name: "Taco Bell"),
        Restaurant(imageName: "kFc", name: "KFC"),
        Restaurant(imageName: "burgerKing", name: "Burger King"),
    ]
    
    override func viewDidLoad() {
            super.viewDidLoad()

            tableView.register(
                TableViewCell.self,
                forCellReuseIdentifier: TableViewController.cellReuseIdentifier
            )
            tableView.delegate = self
            tableView.dataSource = self
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier:
                    TableViewController.cellReuseIdentifier,
                for: indexPath
            ) as? TableViewCell
            else { return UITableViewCell() }

            let restaurant = restaurants[indexPath.row]
            cell.stackView.axis = .vertical
            cell.restaurantLabel.text = restaurant.name
            cell.myImageView.image = UIImage(named: "\(restaurant.imageName).png")
            return cell
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)

            let restaurant = restaurants[indexPath.row]
            goToDetailsViewController(restaurant: restaurant)
        }

        func goToDetailsViewController(restaurant: Restaurant) {
            let storyboard = UIStoryboard(name:"DetailsViewController", bundle: nil)
            guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "detailsVCIdentifier") as? DetailsViewController else { return }

            detailsViewController.restaurant = restaurant
            navigationController?.pushViewController(detailsViewController, animated: true)
        }
    
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return restaurants.count
        }
    
}


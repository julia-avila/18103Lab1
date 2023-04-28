//
//  DetailsViewController.swift
//  lab1
//
//  Created by Julia Avila on 4/28/23.
//

import UIKit

class DetailsViewController: UIViewController {

    var restaurant: Restaurant?
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel?.text = restaurant?.name
        
        if let restaurantImage = restaurant?.imageName {
            image?.image = UIImage(named: "\(restaurantImage).png")
        }
    }
}

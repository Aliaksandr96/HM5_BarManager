//
//  ViewController.swift
//  HM5_BarManager
//
//  Created by Aliaksandr Hunko on 08/07/2022.
//

import UIKit

class Beer {
    
    let name: String
    let price: Double
    let country: String
    
    init(name: String, price: Double, country: String){
        self.name = name
        self.price = price
        self.country = country
        
    }
}

class BarManager {
    
    static let shared = BarManager()
    
    private init() {}
    
    func buyBeer(income: Double) -> Double{
        var price: Double = 0
        price += income
        return price
        
    }
}

class ViewController: UIViewController {
    
    let currency: String = "$"
    
    private var oneBeerPrice: Double = 0
    private var twoBeerPrice: Double = 0
    private var profit: Double = 0
    
    let firstBeer = Beer(name: "Corona", price: 5.5, country: "Mexico")
    let secondBeer = Beer(name: "Lech", price: 3.5, country: "Poland")
    
    // FirstBeer Label's
    
    @IBOutlet weak var firstBeerName: UILabel!
    @IBOutlet weak var countryFirstBeer: UILabel!
    @IBOutlet weak var firstBeerPrice: UILabel!
    
    // SecondBeer Label's
    
    @IBOutlet weak var secondBeerName: UILabel!
    @IBOutlet weak var countrySecondBeer: UILabel!
    @IBOutlet weak var secondBeerPrice: UILabel!
    
    // Profit Label
    
    @IBOutlet weak var profitOfDay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        firstBeerName.text = firstBeer.name
        countryFirstBeer.text = firstBeer.country
        firstBeerPrice.text = "0 " + currency
        
        secondBeerName.text = secondBeer.name
        countrySecondBeer.text = secondBeer.country
        secondBeerPrice.text = "0 " + currency
        
        profitOfDay.text = "0 " + currency
        
    }
    
    @IBAction func buyFirstBeer(_ sender: Any) {
        
        oneBeerPrice += BarManager.shared.buyBeer(income: firstBeer.price)
        firstBeerPrice.text = "\(oneBeerPrice) " + currency
        
    }
    
    @IBAction func buySecondBeer(_ sender: Any) {
        
        twoBeerPrice += BarManager.shared.buyBeer(income: secondBeer.price)
        secondBeerPrice.text = "\(twoBeerPrice) " + currency
        
    }
    
    @IBAction func profitOfDay(_ sender: Any) {
        
        profit = oneBeerPrice + twoBeerPrice
        profitOfDay.text = "\(profit) " + currency
        
    }
    
    @IBAction func newShiftBtn(_ sender: Any){
        twoBeerPrice = 0
        oneBeerPrice = 0
        profit = 0
        firstBeerPrice.text = "\(oneBeerPrice) " + currency
        secondBeerPrice.text = "\(twoBeerPrice) " + currency
        profitOfDay.text = "\(profit) " + currency
        
    }
}

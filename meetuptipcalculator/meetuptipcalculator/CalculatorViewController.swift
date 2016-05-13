//
//  CalculatorViewController.swift
//  meetuptipcalculator
//
//  Created by nicolas on 12/05/2016.
//  Copyright © 2016 nicolas. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // Les outlets permettent d'accéder aux objets dans la Vue
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var additionLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var serviceLevelLabel: UILabel!
    
    @IBOutlet weak var star1Button: UIButton!
    @IBOutlet weak var star2Button: UIButton!
    
    
    var montantAddition = 80
    var currencyChosen = 0
    var serviceLevel = 0
    var tipComments = ["bof", "moyen", "top"]
    var tipLevels = [0.02, 0.05, 0.1]
    
    // Les IBActions sont les fonctions déclenchées par des événements issus de la vue
    @IBAction func segmentedControlChanged(sender: UISegmentedControl) {
        currencyChosen = segmentedControl.selectedSegmentIndex
        updateDisplay()
    }
    
    @IBAction func valueChanged(sender: UISlider) {
     //   print(sender.value)
        montantAddition = Int(sender.value)
        updateDisplay()
    }
    
    @IBAction func star0ButtonPressed(sender: UIButton) {
        serviceLevel = 0
        updateDisplay()
    }
    
    @IBAction func star1ButtonPressed(sender: UIButton) {
        serviceLevel = 1
        updateDisplay()
    }
    
    @IBAction func star2ButtonPressed(sender: UIButton) {
        serviceLevel = 2
        updateDisplay()
    }
    
    // Fonction de mise à jour de l'affichage en fonction des variables globales
    func updateDisplay() {
        var currencyText = " €"
        
        if currencyChosen == 1 {
            currencyText = "$"
        }
        additionLabel.text = String(montantAddition) + currencyText
        
        tipLabel.text = String(Double(montantAddition) * tipLevels[serviceLevel]) + currencyText
        
        serviceLevelLabel.text = tipComments[serviceLevel]
        
        let etoilePleine = UIImage(named: "etoile_pleine")
        let etoileCreuse = UIImage(named: "etoile_creuse")

        star1Button.setBackgroundImage(etoileCreuse, forState: .Normal)
        star2Button.setBackgroundImage(etoileCreuse, forState: .Normal)


        if serviceLevel > 0 {
            star1Button.setBackgroundImage(etoilePleine, forState: .Normal)
        }
        
        if serviceLevel > 1 {
            star2Button.setBackgroundImage(etoilePleine, forState: .Normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDisplay()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

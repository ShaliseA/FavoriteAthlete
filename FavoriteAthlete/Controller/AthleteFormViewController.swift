//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Shalise Ayromloo on 3/22/19.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
//    struct PropertyKeys {
//        static let newUnwind = "NewUnwindToTable"
//
//    }

    var athlete: Athlete?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var leagueText: UITextField!
    @IBOutlet weak var teamText: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       updateFormView()
    }
    

    func updateFormView() {
        
        if let confirmedAthlete = athlete {
           print("confirmed \(confirmedAthlete)!")
            
            nameText.text = confirmedAthlete.name
            teamText.text = confirmedAthlete.team
            leagueText.text  = confirmedAthlete.league
            ageText.text  = confirmedAthlete.age

            
 



        } //closes if-let
        
        
    } //closes updateFormView()
    
    @IBAction func persist(_ sender: UIButton) {
        
        guard let name = nameText.text, let age = ageText.text, let league = leagueText.text, let team = teamText.text else {
            
            return
        } //closes guard

        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: "unwindForm", sender: self)


    } //closes IBAction

}

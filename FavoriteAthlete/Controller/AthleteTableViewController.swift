import UIKit

class AthleteTableViewController: UITableViewController {
    
    
    var athletes: [Athlete] = []
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let addAthleteSegue = "AddAthlete"
        static let editAthleteSegue = "EditAthlete"
        static let newUnwind = "NewUnwindToTable"
        
    }
    
    override func viewDidLoad() {
        let lebron = Athlete(name: "LeBron", age: "34", league: "NBL", team: "Los Angeles Lakers")
        let tom = Athlete(name: "Tom", age: "41", league: "NFL", team: "New England Patriots")
        
        athletes.append(lebron)
        athletes.append(tom)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)

        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let controller = segue.destination as? AthleteFormViewController, let index = tableView.indexPathForSelectedRow,segue.identifier == PropertyKeys.editAthleteSegue {
                
                controller.athlete = athletes[index.row]
            
            
        } //closes if-let

    } //closes override func

    
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
        guard let athleteForm = segue.source as? AthleteFormViewController, let athlete = athleteForm.athlete else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            athletes.remove(at: indexPath.row)
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true) } else {
            athletes.append(athlete)
            
        } //closes else
            
        
        
    } //closes IBAction

}

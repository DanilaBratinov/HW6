import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var moodTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInformation()
    }
    
    
    private func setInformation() {
        
        let information = User.getUserData()
        title = ("\(information.person.name) \(information.person.surname)")
        nameLabel.text = information.person.name
        surnameLabel.text = information.person.surname
        companyLabel.text = information.person.company
        moodTitle.text = information.person.mood
    }
}

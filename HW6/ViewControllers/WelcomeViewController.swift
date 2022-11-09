import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var user: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user ?? "None") 👋"
    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true)
    }
}

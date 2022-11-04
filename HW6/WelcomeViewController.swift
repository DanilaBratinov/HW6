import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    var password: String!
    let clear = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "") 👋"
    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true)
    }
}

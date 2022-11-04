import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String!
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "")"
    }
    
    @IBAction func logOutButton() {
        dismiss(animated: true)
    }
}

import UIKit

class BioViewController: UIViewController {
    let information = User.getUserData()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ("\(information.person.name) \(information.person.surname) Bio")
    }
}

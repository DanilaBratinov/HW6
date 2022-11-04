import UIKit

class MainViewController: UIViewController {

    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    
    private var userName = "User"
    private let password = "123"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IB Action

    @IBAction func forgotUserNameButton() {
        showAlert(withTitler: "Oops!", andMessage: "Your name is \(userName)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(withTitler: "Oops!", andMessage: "Your password is \(password)")
    }
    
    @IBAction func loginButton() {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "Second") as? SecondViewController else {return}
         
        if userNameTF.text == userName && passwordTF.text == password {
            secondVC.userName = userName
            secondVC.password = password
            secondVC.modalPresentationStyle = .fullScreen
            
            present(secondVC, animated: true)
            
            userNameTF.text = ""
            passwordTF.text = ""
        } else {
            showAlert(withTitler: "Invalid Login or Password", andMessage: "Pleace, enter correct login or password")
        }
    }
}

//MARK: - UIAlertController

extension MainViewController {
    private func showAlert(withTitler title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

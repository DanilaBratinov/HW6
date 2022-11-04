import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    
    private var userName = "User"
    private let password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IB Action
    @IBAction func forgotUserNameButton() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(userName)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is \(password)")
    }

    @IBAction func logInButton() {
        if userNameTF.text != userName && passwordTF.text != password {
            showAlert(withTitle: "Invalid Login or Password", andMessage: "Pleace, enter correct login or password")
        }
    }
    //MARK: - prepare - unwind
    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
            welcomeVC.modalPresentationStyle = .fullScreen
            welcomeVC.userName = userName
            welcomeVC.password = password
        }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let welcomeVC = segue.source as? WelcomeViewController else {return}
        userNameTF.text = welcomeVC.clear
        passwordTF.text = welcomeVC.clear
    }
    //MARK: - resingFirstResponder()
    @IBAction func tap(_ sender: Any) {
        userNameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }
    // Метод touchesBegan выдавал ошибку, поэтому использовал resingFirstResponder. В разборе постараюсь понять, что именно делал не так)
}

    //MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

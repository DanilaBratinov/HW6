import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var userNameTF: UITextField!
    
    private let information = User(person: Person())

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewController = tabBarVC.viewControllers else { return }
        if let firstVC = viewController.first as? WelcomeViewController {
            firstVC.user = information.person.name
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    //MARK: - IB Action
    
    @IBAction func logInButton() {
        guard userNameTF.text == information.login, passwordTF.text == information.password else {
            showAlert(
                withTitle: "Invalid Login or Password",
                andMessage: "Pleace, enter correct login or password"
            )
            return
        }
        performSegue(withIdentifier: "WelcomeVC", sender: nil)
    }
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Oops!", andMessage: "Your name is \(information.login)")
        : showAlert(withTitle: "Oops!", andMessage: "Your password is \(information.password)")
    }
    //MARK: - prepare - unwind
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
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

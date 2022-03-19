//
//  LoginViewController.swift
//  gb_vk_client
//
//  Created by 5vi5t on 09.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let fromLoginToTabBarSegue = "fromLoginToTabBar"
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: fromLoginToTabBarSegue, sender: nil)
        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return }
        if login == "admin" && password == "123456" {
            print("успешная авторизация")
            performSegue(withIdentifier: fromLoginToTabBarSegue, sender: nil)
        } else {
            print("неуспешная авторизация")
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardHeight = ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue)?.height else { return }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        self.scrollView.contentInset = insets
        self.scrollView.scrollIndicatorInsets = insets
    }
    
    @objc func keyboardWillHide() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        recognizer.cancelsTouchesInView = false
        self.scrollView.addGestureRecognizer(recognizer)
        fillFriendsData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func fillFriendsData() {
        let friend1 = Friend(name: "Амогус", avatar: "amogus1", surName: "Красный", fotos: ["amogus1", "amogus2", "amogus3", "amogus4", "amogus5"])
        let friend2 = Friend(name: "Джокер", avatar: "joker1", surName: "Добрый", fotos: ["joker1", "joker2", "joker3", "joker4", "joker5"])
        
        Storage.shared.friendsArray.append(friend1)
        Storage.shared.friendsArray.append(friend2)
    }
}

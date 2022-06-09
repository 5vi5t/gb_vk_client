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
//        fillFriendsData()
//        fillGroupsData()
        addSession()
        print(Session.shared.token, Session.shared.userId)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
//    func fillFriendsData() {
//        let friend1 = Friend(name: "Амогус", avatar: "amogus1", surname: "Красный", fotos: ["amogus1", "amogus2", "amogus3", "amogus4", "amogus5"])
//        let friend2 = Friend(name: "Джокер", avatar: "joker1", surname: "Добрый", fotos: ["joker1", "joker2", "joker3", "joker4", "joker5"])
//        let friend3 = Friend(name: "Ана", avatar: "ana", surname: "Бабка", fotos: ["ana"])
//        let friend4 = Friend(name: "Бастион", avatar: "bastion", surname: "Бастик", fotos: ["bastion"])
//        let friend5 = Friend(name: "Кулак", avatar: "doomfist", surname: "Думфист", fotos: ["doomfist"])
//        let friend6 = Friend(name: "ДВА", avatar: "dva", surname: "Дива", fotos: ["dva"])
//        let friend7 = Friend(name: "Генджи", avatar: "genji", surname: "Генга", fotos: ["genji"])
//        let friend8 = Friend(name: "Ханзо", avatar: "hanzo", surname: "Лук", fotos: ["hanzo"])
//        let friend9 = Friend(name: "Крысавчик", avatar: "junkrat", surname: "Джанк", fotos: ["junkrat"])
//        let friend10 = Friend(name: "Люсио", avatar: "lucio", surname: "Лисёк", fotos: ["lucio"])
//        let friend11 = Friend(name: "Мерси", avatar: "mercy", surname: "Мерка", fotos: ["mercy"])
//        let friend12 = Friend(name: "Мойра", avatar: "moira", surname: "О'Доран", fotos: ["moira"])
//        let friend13 = Friend(name: "Ориса", avatar: "orisa", surname: "Лошадь", fotos: ["orisa"])
//        let friend14 = Friend(name: "Фара", avatar: "pharah", surname: "Амари", fotos: ["pharah"])
//        let friend15 = Friend(name: "Жнец", avatar: "reaper", surname: "Рипер", fotos: ["reaper"])
//        let friend16 = Friend(name: "Рейнхардт", avatar: "reinhardt", surname: "Дед", fotos: ["reinhardt"])
//        let friend17 = Friend(name: "Турбосвин", avatar: "roadhog", surname: "Хог", fotos: ["roadhog"])
//        let friend18 = Friend(name: "Солдат", avatar: "soldier_76", surname: "76", fotos: ["soldier_76"])
//        let friend19 = Friend(name: "Сомбра", avatar: "sombra", surname: "Оливия", fotos: ["sombra"])
//        let friend20 = Friend(name: "Симметра", avatar: "symmetra", surname: "Симка", fotos: ["symmetra"])
//        let friend21 = Friend(name: "Торбьёрн", avatar: "torbjorn", surname: "Торб", fotos: ["torbjorn"])
//        let friend22 = Friend(name: "Трейсер", avatar: "tracer", surname: "Лена", fotos: ["tracer"])
//        let friend23 = Friend(name: "Вдова", avatar: "widowmaker", surname: "Видоу", fotos: ["widowmaker"])
//        let friend24 = Friend(name: "Винстон", avatar: "winston", surname: "Макака", fotos: ["winston"])
//        let friend25 = Friend(name: "Заря", avatar: "zarya", surname: "Зарянова", fotos: ["zarya"])
//        let friend26 = Friend(name: "Дзеньятта", avatar: "zenyatta", surname: "Зен", fotos: ["zenyatta"])
//
//        Storage.shared.friendsArray.append(friend1)
//        Storage.shared.friendsArray.append(friend2)
//        Storage.shared.friendsArray.append(friend3)
//        Storage.shared.friendsArray.append(friend4)
//        Storage.shared.friendsArray.append(friend5)
//        Storage.shared.friendsArray.append(friend6)
//        Storage.shared.friendsArray.append(friend7)
//        Storage.shared.friendsArray.append(friend8)
//        Storage.shared.friendsArray.append(friend9)
//        Storage.shared.friendsArray.append(friend10)
//        Storage.shared.friendsArray.append(friend11)
//        Storage.shared.friendsArray.append(friend12)
//        Storage.shared.friendsArray.append(friend13)
//        Storage.shared.friendsArray.append(friend14)
//        Storage.shared.friendsArray.append(friend15)
//        Storage.shared.friendsArray.append(friend16)
//        Storage.shared.friendsArray.append(friend17)
//        Storage.shared.friendsArray.append(friend18)
//        Storage.shared.friendsArray.append(friend19)
//        Storage.shared.friendsArray.append(friend20)
//        Storage.shared.friendsArray.append(friend21)
//        Storage.shared.friendsArray.append(friend22)
//        Storage.shared.friendsArray.append(friend23)
//        Storage.shared.friendsArray.append(friend24)
//        Storage.shared.friendsArray.append(friend25)
//        Storage.shared.friendsArray.append(friend26)
//    }
//
//    func fillGroupsData() {
//        let group1 = Group(name: "Fantasy Books", avatar: "group1", description: nil)
//        let group2 = Group(name: "Magic Books", avatar: "group2", description: nil)
//        let group3 = Group(name: "Adventure Books", avatar: "group3", description: "Frigate")
//
//        Storage.shared.allGroupsArray.append(group1)
//        Storage.shared.allGroupsArray.append(group2)
//        Storage.shared.allGroupsArray.append(group3)
//    }
    
    func addSession() {
        Session.shared.token = "asdf"
        Session.shared.userId = "123"
    }
}

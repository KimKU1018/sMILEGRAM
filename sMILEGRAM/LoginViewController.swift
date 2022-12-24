//
//  LoginViewController.swift
//  sMILEGRAM
//
//  Created by KU Kim on 2022/12/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?

    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        guard let userInfo = self.userInfo else { return }
        if userInfo.email == self.email
            && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
//        self.present(registerViewController, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }

    }

}

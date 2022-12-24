//
//  RegisterViewController.swift
//  sMILEGRAM
//
//  Created by KU Kim on 2022/12/20.
//

import UIKit

class RegisterViewController: UIViewController {

    
        // MARK: - Properties
        //유효성 검사를 위한 프로퍼티
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidName = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false{
        didSet {
            self.validateUserInfo()
        }
    }
    
        
        // Textfields
    
        @IBOutlet var emailTextField: UITextField!
    
        @IBOutlet var nameTextField: UITextField!
    
        @IBOutlet var nicknameTextField: UITextField!
    
        @IBOutlet var passwordTextField: UITextField!
    
        @IBOutlet var signupButton: UIButton!
    
    var textFields: [UITextField] {
            [emailTextField, nameTextField, nicknameTextField, passwordTextField]
        }
    
        
        
        // MARK: - Lifecyce
        override func viewDidLoad() {
            super.viewDidLoad()
            setupTextField()
            
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        }
        
        
        
        
        // MARK: - Actions
        @objc
        func textFieldEditingChanged(_ sender: UITextField){
            let text = sender.text ?? ""
            
            switch sender {
            case emailTextField:
                print("email")
                self.email = text
                //self.isValidEmail = text.isValidEmail()
                
            case nameTextField:
                self.isValidName = text.count > 2
                self.name = text
                
            case nicknameTextField:
                self.isValidNickname = text.count > 2
                self.nickname = text
                
            case passwordTextField:
                print("pass")
                self.password = text
                //self.isValidPassword = text.isValidPassword()
                
            default:
                fatalError("Missing TextField...")
            }
            
        }
    
    
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        self.navigationController?
            .popViewController(animated: true)
    }
    
        
    @IBAction func registerButtonDidtap(_ sender: UIButton) {
        self.navigationController?
            .popViewController(animated: true)
        
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password)
        
        self.userInfo?(userInfo)
    }
    
        // MARK: - Helpers
    private func setupTextField(){
        
        textFields.forEach  { tf in
            tf.addTarget(self,
                         action: #selector(textFieldEditingChanged(_:)),
                         for: .editingChanged)
        }
    }
    
    private func validateUserInfo(){
        
        if isValidEmail
            && isValidName
            && isValidNickname
            && isValidPassword{
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor =
                    UIColor.white
            }
        } else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor =
                    UIColor.blue
            }
        }
    }
}

// 정규표현식
extension String{
    //대문자, 소문자, 특수문자, 숫자 8자 이상일 때 -> True
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @ 2글자
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2, 64}"
        let emailText = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailText.evaluate(with: self)
    }
}

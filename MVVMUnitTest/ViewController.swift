//
//  ViewController.swift
//  MVVMUnitTest
//
//  Created by AJAY on 26/07/21.
//  Copyright © 2021 matrix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     @IBOutlet weak var emailText: UITextField!
        @IBOutlet weak var passText: UITextField!
       private var loginViewModelObj: LoginViewModel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
    //        self.loginModelObj = LoginModel(emailString: emailText.text!, passString: passText.text!, emalValidetion: false, passWordValidetion: false)
    //            self.loginViewModelObj = LoginViewModel(loginData: loginModelObj)
    //        self.biend()
       
        }
        @IBAction func loginBtn(_ sender: UIButton) {
            
    //        self.loginViewModelObj = LoginViewModel(emialTex: emailText.text!, passTex: passText.text!)
            //WITH CALL BACK FUNCTION
            //        loginViewModelObj.callBack { [weak self] (valObj) in
            //           // print(valObj)
            //
            //            if let email = valObj.emalValidetion  {
            //                if email == false {
            //                    self?.showAlert(message: "Please enter valid mail.")
            //                    return
            //                }
            //            }
            //            if let pas = valObj.passWordValidetion  {
            //                if pas == false {
            //                    self?.showAlert(message: "Please enter pass more then 6.")
            //                    return
            //                }
            //            }
            //        }
            
            self.loginViewModelObj = LoginViewModel(emialTex: emailText.text!, passTex: passText.text!)
            self.loginViewModelObj.bindLoginViewModelToController = {
                DispatchQueue.main.async {
                self.lo()
                }
            }
            
        }
        
        
        func lo()  {
             print(self.loginViewModelObj.loginDataVar ?? "")
        }
        
        func showAlert(message: String)  {
            DispatchQueue.main.async {
             let alertController = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
                   alertController.addAction(UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: {
                       action in
                   }))
                  
                   self.present(alertController, animated: true, completion: nil)
            }
        }
}


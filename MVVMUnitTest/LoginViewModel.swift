//
//  LoginViewModel.swift
//  MVVMUnitTest
//
//  Created by AJAY on 26/07/21.
//  Copyright © 2021 matrix. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    let eml: String
    let pas: String
       private(set) var loginDataVar : SettingsModel! {
              didSet {
               //print(loginDataVar)
                  self.bindLoginViewModelToController()
              }
          }
       
       var bindLoginViewModelToController : (() -> ()) = {}
    
     init(emialTex: String, passTex: String) {
        self.eml = emialTex
        self.pas = passTex
        print("viewmodel init")
        
        self.callFuncToGetSettingData()
    }
    
        //WITH CALL BACK FUNCTION
    //    mutating func callBack(compli: @escaping((_ apiResponse: LoginModel)->Void)) {
    //             let emailValue = self.emailStr.isValidEmail() ? true : false
    //            let passvalue = self.passWord.count > 6 ? true : false
    //           let loginModelObj = LoginModel(emailString: self.emailStr, passString: self.passWord, emalValidetion: emailValue, passWordValidetion: passvalue)
    ////           self.loginDataVar = loginModelObj
    //        compli(loginModelObj)
    //        if emailValue && passvalue {
    //                   self.callAPI()
    //               }
    //
    //    }
    
    
    func callFuncToGetSettingData() {
     APIBaseClass.APIBaseClassObject.apiToGetSettingsData { (settingsModel) in
         print(settingsModel)
       self.loginDataVar = settingsModel
     }
    }
}
extension String {
    func isValidEmail() -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: self)
       }
}

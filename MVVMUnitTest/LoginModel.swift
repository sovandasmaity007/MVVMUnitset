//
//  LoginModel.swift
//  UnitTestDemo
//
//  Created by AJAY on 25/07/21.
//  Copyright © 2021 matrix. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    let emailString: String?
    let passString: String?
    let emalValidetion: Bool?
    let passWordValidetion: Bool?
}

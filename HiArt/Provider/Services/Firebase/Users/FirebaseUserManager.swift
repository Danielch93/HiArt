//
//  FirebaseUserManager.swift
//  HiArt
//
//  Created by Daniel Charry on 19/03/23.
//

import UIKit
import FirebaseAuth

struct FirebaseUserManager {
    static func createUser() {
        Auth.auth().createUser(withEmail: "daniel@correo.com", password: "123456") { authResult, error in
            print("authResult", authResult as Any)
            print("error", error as Any)
        }
    }
}

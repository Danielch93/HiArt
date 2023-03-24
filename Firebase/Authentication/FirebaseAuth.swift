//
//  FirebaseAuth.swift
//  HiArt
//
//  Created by Daniel Charry on 15/03/23.
//

import UIKit
import FirebaseAuth

class FirebaseAuth: UIViewController {
    let auth = Auth.auth()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FirebaseAuth {
    func signIn() {
        auth.signIn(withEmail: "daniel@gmail.com",
                    password: "daniel123") { [weak self] (result, error) in
            guard let self = self else { return }
            print("Login success!")
        }
    }

    func signOut() {
        do {
            try auth.signOut()
            print("Logout success!")
        } catch {
            print("Something wrong happened")
        }
    }
}

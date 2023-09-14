//
//  FirebaseManager.swift
//  HiArt
//
//  Created by Daniel Charry on 20/03/23.
//

import FirebaseAuth

struct FirebaseManager {
    static public func Connection() {
        Auth.auth().useEmulator(withHost: "localhost", port: 9099)
    }
}

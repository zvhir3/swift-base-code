//
//  UserModel.swift
//  BaseSwift
//
//  Created by Nightfall Nest on 14/05/2024.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted(primaryKey: true) var email: String
    @Persisted var name: String
}

func isAnyEmailExist() -> Bool {
    let realm = try! Realm()
    return !realm.objects(User.self).isEmpty
}

func saveEmail(email: String) {
    let realm = try! Realm()
    try! realm.write {
        let user = User()
        user.email = email
        realm.add(user)
    }
}

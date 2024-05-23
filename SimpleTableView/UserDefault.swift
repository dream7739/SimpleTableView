//
//  UserDefault.swift
//  SimpleTableView
//
//  Created by 홍정민 on 5/23/24.
//

import Foundation

//property wrapper - swift5.1 소개
//get-set 로직을 프로퍼티 자체에 연결할 수 있어 코드 재사용성을 높임
//행동을 정의하는 타입
@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    let storage: UserDefaults
    
    //get set 될때를 필수로 구현
    var wrappedValue: T {
        get{
            self.storage.object(forKey: key) as? T ?? defaultValue
        }set{
            self.storage.set(newValue, forKey: key)
        }
    }
}

class ProductManager {
    //static :  인스턴스(instance)가 아닌 선언된 type과 연결할 수 있도록 함 
    //EX - ProductManager.productList
    
    @UserDefault(key: "productList", defaultValue: [], storage: .standard)
    static var productList: [String]
}

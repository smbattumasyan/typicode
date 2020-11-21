//
//  CodingUserInfoKey+Extension.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

public extension CodingUserInfoKey {
    // Helper property to retrieve the Core Data managed object context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

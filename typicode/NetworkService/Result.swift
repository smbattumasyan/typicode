//
//  Result.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

// MARK: - Result
/** Generic enum used for either the success or failure of an operation */

enum Result<T> {
    case success(T)
    case failure(Error)
}

// MARK: - Result Callback
typealias ResultCallback<T> = (Result<T>) -> Void

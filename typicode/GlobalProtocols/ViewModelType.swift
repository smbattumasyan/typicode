//
//  ViewModelType.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    func transform(_ input: Input) -> Output
}

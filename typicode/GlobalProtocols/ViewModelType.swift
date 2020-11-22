//
//  ViewModelType.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/21/20.
//

import Foundation

protocol ViewModelType {
    // input datas to viewModel
    associatedtype Input
    // output view-related datas
    associatedtype Output
    // transform input datas to output datas
    func transform(_ input: Input) -> Output
}

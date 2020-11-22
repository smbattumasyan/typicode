//
//  StoryboardInstance.swift
//  typicode
//
//  Created by Smbat Tumasyan on 11/22/20.
//

import UIKit

protocol StoryboardInstance {
    static var storyboardName: StoryboardName {get set}
}

extension StoryboardInstance {
    static var storyboardInstance: Self? {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:String(describing: self)) as? Self
        return vc
    }
}

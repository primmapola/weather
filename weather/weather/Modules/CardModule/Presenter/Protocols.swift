//
//  Protocols.swift
//  weather
//
//  Created by  user on 24.03.2024.
//

import Foundation

protocol CardModuleInput {
}

protocol CardModuleOutput: AnyObject {
}

protocol CardViewInput: AnyObject {
    func initWithCity(_ city: String)
}

protocol CardViewOutput: AnyObject {
    func didLoadView()
}

//
//  CardAssembly.swift
//  weather
//
//  Created by  user on 24.03.2024.
//

import Foundation

class CardAssembly {
    
    func assemble() -> CardView {
        let presenter = CardPresenter()
        let view = CardView(output: presenter)
        presenter.view = view
        
        return view
    }
}


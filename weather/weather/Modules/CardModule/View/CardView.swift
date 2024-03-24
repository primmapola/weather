//
//  CardView.swift
//  weather
//
//  Created by  user on 24.03.2024.
//

import UIKit
import CoreLocation

final class CardView: UIViewController {
    
    // MARK: - Properties
    
    private let output: CardViewOutput
    
    private let cityNameLabel = UILabel()
    
    // MARK: - Initialization

    init(output: CardViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.didLoadView()
        setupUI()
    }
}

// MARK: - User interface

extension CardView {
    func setupUI() {
        view.backgroundColor = .white
        
        setupCityNameLabel()
    }
    
    func setupCityNameLabel() {
        view.addSubview(cityNameLabel)
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 30)
        cityNameLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cityNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cityNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension CardView: CardViewInput {
    func initWithCity(_ city: String) {
        self.cityNameLabel.text = city
    }
}

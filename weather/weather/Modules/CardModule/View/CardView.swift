//
//  CardView.swift
//  weather
//
//  Created by  user on 24.03.2024.
//

import UIKit
import CoreLocation

final class CardView: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Properties
    
    private let output: CardViewOutput
    private let locationManager = CLLocationManager()
    
    // MARK: -

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
        
        view.backgroundColor = .red
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
}

extension CardView: CardViewInput {
    
}

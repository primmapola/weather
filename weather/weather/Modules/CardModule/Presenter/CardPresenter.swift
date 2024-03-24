//
//  CardPresenter.swift
//  weather
//
//  Created by  user on 24.03.2024.
//

import Foundation
import CoreLocation

final class CardPresenter: NSObject {
    
    weak var view: CardViewInput?
    
    private let weatherService = WeatherService()
    private let locService = LocationService()
    
    override init() {
        super.init()
        locService.onLocationDetected = { [weak self] city in
            self?.view?.initWithCity(city)
            self?.fetchWeather(for: city)
        }
    }
}

extension CardPresenter: CardViewOutput {
    func didLoadView() {
        locService.requestLocation()
    }

    private func fetchWeather(for city: String) {
        weatherService.fetchWeather(city) { [weak self] weatherResponse, error in
            guard self != nil else { return }

            if let error = error {
                print("Ошибка при получении данных о погоде: \(error)")
                return
            }

            if let weatherResponse = weatherResponse {
                print("Температура в \(weatherResponse.name): \(weatherResponse.main.temp)°C")
            }
        }
    }
}

//
//  WeatherService.swift
//  weather
//
//  Created by  user on 24.03.2024.
//

import Foundation

class WeatherService {

    func fetchWeather(_ city: String, completion: @escaping (WeatherResponse?, Error?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=f0f910bfb5f45e98ac0ba91ca0203d1a&units=metric"
        guard let url = URL(string: urlString) else {
            completion(nil, nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, nil)
                return
            }

            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(weatherResponse, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

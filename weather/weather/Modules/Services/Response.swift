//
//  Response.swift
//  weather
//
//  Created by  user on 24.03.2024.
//

import Foundation

struct WeatherResponse: Decodable {
    let coord: Coordinates
    let weather: [Weather]
    let base: String
    let main: MainWeather
    let visibility: Int
    let wind: Wind
    let rain: Rain?
    let clouds: Clouds
    let dt: Int
    let sys: System
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

// Координаты местоположения
struct Coordinates: Decodable {
    let lon: Double
    let lat: Double
}

// Информация о погодных условиях
struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// Подробная информация о погоде
struct MainWeather: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    let seaLevel: Int?
    let grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// Информация о ветре
struct Wind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double
}

// Данные о дожде
struct Rain: Decodable {
    let h1: Double

    enum CodingKeys: String, CodingKey {
        case h1 = "1h"
    }
}

// Информация о облачности
struct Clouds: Decodable {
    let all: Int
}

// Дополнительная информация о местоположении
struct System: Decodable {
    let type: Int
    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}


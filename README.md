# MonoWeatherApp

MonoWeatherApp is an iOS application that provides weather information for major Ukrainian cities.  

## Light Mode

<p align="center">
  <img src="https://github.com/user-attachments/assets/ef1748b2-fd76-4acb-ba80-57ec8f8f9441" width="250">
  <img src="https://github.com/user-attachments/assets/be5abb88-a42f-4668-91bf-bd3c4293fd03" width="250">
  <img src="https://github.com/user-attachments/assets/7c1a4168-94a9-4e43-a2d7-f1c17c275ddf" width="250">
</p>

## Dark Mode

<p align="center">
  <img src="https://github.com/user-attachments/assets/fbd4d7f6-0cd5-4b56-90cc-aded4f750fd4" width="250">
  <img src="https://github.com/user-attachments/assets/59d9a495-42ac-4611-b31d-74ddc5afca59" width="250">
  <img src="https://github.com/user-attachments/assets/4eda7579-a0c9-4096-a39b-4058fb469383" width="250">
</p>

---

## Features

- Displays current weather conditions for major Ukrainian cities (Kyiv, Lviv, Odesa, Kharkiv, Dnipro, Donetsk, Zaporizhzhia, Sevastopol).
- Light/Dark theme switching with persistence
- Fetches real-time weather data from the OpenWeatherMap API.
  
---

## Technology Stack

- **Language:** Swift 6.1+
- **UI Framework:** UIKit 
- **Architecture:** MVVM
- **Networking:** URLSession (OpenWeatherMap)
- **Minimum iOS Version:** iOS 18 (tested up to iOS 26)

---

- ## Prerequisites
- Xcode 16 or later
- iOS 18 or later (for simulator or device)
- An OpenWeatherMap API key (sign up at [openweathermap.org](https://openweathermap.org))

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Git5737/MonoWeatherApp.git
   cd MonoWeatherApp
2. Open MonoWeatherApp.xcodeproj in Xcode 16+.
3. Build and run the project on a simulator or a device.

---

## Configuration

1. Sign up at OpenWeatherMap and obtain an API key.
2. Create the Config.swift file and replace YOUR_API_KEY with your API key.
   ```bash
   import Foundation

   struct Config {
      static let apiKey = "YOUR_API_KEY"
   }

   

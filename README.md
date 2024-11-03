# The Journal 

A feature-rich news application built using **Flutter**, integrated with **Cubit** and **Bloc** state management. The app fetches news data from public APIs and includes an efficient search feature for user convenience, along with support for light and dark themes.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [API Integration](#api-integration)
- [State Management](#state-management)
- [Themes](#themes)
- [Contributing](#contributing)
- [License](#license)

## Features

- 📰 **Real-time News Fetching**: Get the latest news from various sources through API integration.
- 🔄 **Cubit and Bloc State Management**: Ensures smooth and reactive UI interactions.
- 🔍 **Search Functionality**: Users can search for specific news articles with ease.
- 📱 **Responsive Design**: Fully optimized for different screen sizes and devices.
- 📑 **Category-based News**: Browse news by categories such as technology, sports, health, and more.
- 🌗 **Light and Dark Theme**: Users can switch between light and dark themes for a comfortable reading experience.

## Installation

To get started with the project:

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/news_application.git
   cd news_application
   
2. **Install dependencies**
   ```bash
   flutter pub get
   
3. **Run The App**
   ```bash
   flutter run
   
## API Integration

- The application fetches data from public news APIs using the `http` package for HTTP requests.
- Ensure you have an API key if required by your chosen news provider.
- Implement API calls in the `services/` directory to keep network-related code modular and maintainable.

## State Management

- **Cubit**: Used for simple state transitions, providing a straightforward way to manage state with minimal boilerplate.
- **Bloc**: Employed for more complex state handling, using an event-driven approach for precise state control and advanced UI updates.

### Structure:
- **Cubit classes** in the `cubit/` directory manage individual state changes.
- Event and state classes are used in **Bloc** to define the flow of data.

## Themes

The application supports both light and dark themes to enhance user experience:

- **Light Theme**: Ideal for well-lit environments, offering high readability with bright interface colors.
- **Dark Theme**: Reduces eye strain in low-light conditions, with a darker color palette for better focus and comfort.


   

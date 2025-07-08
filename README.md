# CookBook - Flutter Recipe App

A beautiful and modern Flutter application that helps users discover and explore recipes from around the world. Built with Material Design 3 and integrated with the Spoonacular API for real-time recipe data.

## 🍳 Features

- **Recipe Discovery**: Browse through a curated collection of recipes from various cuisines
- **Today's Top Picks**: Featured recipes displayed in an attractive horizontal scroll view
- **Cuisine Categories**: Filter recipes by cuisine type (African, Asian, American, British, etc.)
- **Search Functionality**: Search and explore recipes in a grid layout
- **Responsive Design**: Optimized for different screen sizes and orientations
- **Modern UI**: Clean, intuitive interface with custom styling and animations
- **Favorites System**: Save your favorite recipes (UI ready, backend integration pending)

## 📱 Screenshots

The app features a clean, modern interface with:
- Custom app bar with rounded corners and shadow effects
- Horizontal scrolling recipe cards for featured content
- Grid layout for search results
- Cuisine category chips for easy filtering
- Bottom navigation for seamless navigation

## 🛠️ Technology Stack

- **Framework**: Flutter 3.4.0+
- **Language**: Dart
- **API**: Spoonacular Recipe API
- **UI**: Material Design 3
- **HTTP Client**: http package
- **Fonts**: Custom Arial Rounded fonts

## 📋 Prerequisites

Before running this project, make sure you have:

- Flutter SDK (version 3.4.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Spoonacular API key (for recipe data)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd cookbook
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure API Key

1. Get a free API key from [Spoonacular](https://spoonacular.com/food-api)
2. Create a file `lib/util/secrets.dart` with the following content:

```dart
const String spoonacularapi = 'YOUR_API_KEY_HERE';
```

### 4. Run the Application

```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point and theme configuration
├── home_page.dart           # Main navigation and bottom navigation bar
├── home_page_body.dart      # Home screen content layout
├── display_tile.dart        # Recipe display component with API integration
├── recipe_card.dart         # Individual recipe card widget
├── categories_chip.dart     # Cuisine category selection
├── cusine_tile.dart         # Individual cuisine tile widget
├── search_page.dart         # Search functionality page
├── globals.dart             # Global variables and constants
└── util/
    └── secrets.dart         # API keys and sensitive data
```

## 🎨 UI Components

### Theme Configuration
- **Primary Color**: Green theme (#B1FFC7)
- **Font Family**: Arial Rounded
- **Material Design 3**: Enabled for modern UI components
- **Custom App Bar**: Rounded corners with shadow effects

### Key Widgets
- **DisplayTile**: Handles recipe fetching and display logic
- **RecipeCard**: Displays individual recipes with images and titles
- **CategoriesChip**: Horizontal scrolling cuisine categories
- **CuisineTile**: Individual cuisine selection tiles

## 🔧 API Integration

The app integrates with the Spoonacular API to fetch recipe data:

- **Endpoint**: `https://api.spoonacular.com/recipes/complexSearch`
- **Features**: Recipe search, filtering, and data retrieval
- **Error Handling**: Graceful error handling for API failures

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🚀 Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Spoonacular](https://spoonacular.com/) for providing the recipe API
- [Flutter](https://flutter.dev/) team for the amazing framework
- [Material Design](https://material.io/) for design guidelines

## 📞 Support

If you encounter any issues or have questions, please:

1. Check the [Issues](https://github.com/yourusername/cookbook/issues) page
2. Create a new issue with detailed information
3. Contact the development team

---

**Happy Cooking! 🍽️**
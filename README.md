<<<<<<< HEAD
# Country-Search-Application

## **Overview**

The **Country-Search-Application** allows users to explore countries, view detailed information about each country, and switch between light and dark themes. The app provides a search functionality to filter countries and an interactive carousel of country flags or images. It fetches country data from a public REST API and allows users to view country-specific details such as states/provinces, flags, capitals, population, and more.

---

## **Key Features**

- **Country List**: Displays a scrollable list of country names fetched from a REST API.
- **Country Details**: Provides detailed information about each country, including:
  - Name
  - States/Provinces (if applicable)
  - Flag (image)
  - Population
  - Capital city
  - Continent
  - Country code
- **Search Functionality**: Allows users to filter the country list by name using a search bar.
- **Theme Customization**: Users can toggle between light and dark themes for the app's UI.
- **Interactive Carousel**: Displays an interactive carousel of country flags or related images.
- **Responsive Design**: The app is designed to work across multiple screen sizes.

---

## **Dependencies**

### 1. **get** (for state management and navigation)
- **Version**: `^4.6.5`
- **Purpose**: `get` is used for state management, navigation, and binding reactive data. It simplifies managing app state, theme switching, and data updates across screens.

```dart
final ThemeController themeController = Get.put(ThemeController());
```

### 2. **http** (for making HTTP requests)
- **Version**: `^0.13.4`
- **Purpose**: `http` is used to send HTTP requests to the Country API to fetch country data, including names, capitals, and timezone information.
final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

### 3. **carousel_slider** (for carousel functionality)
- **Version**: `^5.0.0`
- **Purpose**: `The carousel_slider` package enables users to swipe through a carousel of images, such as country flags or related images
>>>>>>> 87f6b7d720b77eb3fef6b77ee2b506ec98141160

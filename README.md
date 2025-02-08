# Flickr Search App - iOS Code Challenge

This is an iOS app built using **SwiftUI** that allows users to search for images on Flickr and view details about each image. The app fetches data from the [Flickr Public Feed API](https://www.flickr.com/services/feeds/docs/photos_public/) and displays the results in a grid. Tapping on an image opens a detail view with additional information.

---

## Features

- **Search Bar**: Users can enter a search term (e.g., "forest" or "bird") to find images.
- **Image Grid**: Displays a grid of thumbnail images matching the search term.
- **Image Detail View**: Shows the full image, title, author, published date, and description.
- **Progress Indicator**: Displays a loading spinner while fetching images.
- **Unit Tests**: Includes unit tests for the data model and network layer.
- **UI Tests**: Includes UI tests to verify the app's functionality.

---

## Requirements

- iOS 15.6+
- Xcode 16.0+
- Swift 6.0.3+

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/g4ever81/FlickrSearchApp.git
   ```
2. Open the project in Xcode:
   ```bash
   cd FlickrSearchApp
   open FlickrSearchApp.xcodeproj
   ```
3. Build and run the app on a simulator or physical device.

---

## Code Structure

### Data Model
- **`FlickrImage`**: Represents an image from the Flickr API.
  - Properties: `title`, `author`, `published`, `description`, `media`.
  - Computed Properties: `plainDescription`, `formattedDate`.

- **`FlickrResponse`**: Represents the response from the Flickr API.
  - Property: `items` (an array of `FlickrImage` objects).

### Network Layer
- **`FlickrService`**: Handles API requests to fetch images from Flickr.
  - Method: `fetchImages(for:)` - Fetches images based on a search term.

### Views
- **`ContentView`**: The main view with a search bar and image grid.
- **`SearchBar`**: A reusable search bar component.
- **`ImageDetailView`**: Displays detailed information about a selected image.

### Tests
- **Unit Tests**:
  - `FlickrImageTests`: Tests the `FlickrImage` data model.
  - `FlickrResponseTests`: Tests the `FlickrResponse` data model.
  - `FlickrServiceTests`: Tests the `FlickrService` network layer.

- **UI Tests**:
  - `FlickrSearchAppUITests`: Tests the app's user interface and navigation flow (Pending).

---

## Running Tests

### Unit Tests
1. Open the **Test Navigator** in Xcode (⌘ + 6).
2. Click the **Run** button next to each test class or method.

### UI Tests
1. Open the **Test Navigator** in Xcode (⌘ + 6).
2. Click the **Run** button next to the `FlickrSearchAppUITests` class.

---

## Usage

1. Launch the app.
2. Enter a search term in the search bar (e.g., "porcupine" or "forest, bird").
3. View the grid of images matching the search term.
4. Tap on an image to see its details:
   - Full image
   - Title
   - Author
   - Published date
   - Description

---

## Screenshots

- Please refer to the `screenshots` folder for visual examples of the app in action.

---

## Future Improvements

- **Accessibility Support**: Add VoiceOver and Dynamic Type support.
- **Landscape Orientation**: Support landscape mode for better usability.
- **Animations**: Add smooth transitions between views.

---

## Acknowledgments

- [Flickr Public Feed API](https://www.flickr.com/services/feeds/docs/photos_public/) for providing the image data.
- [SwiftUI](https://developer.apple.com/documentation/swiftui/) for the UI framework.
- [Combine](https://developer.apple.com/documentation/combine/) for handling asynchronous events.

---

## Contact

For questions or feedback, please open an issue on GitHub or contact the maintainer:

- **Your Name** Gaurav Narendrakumar Mehta
- **Email**: mehtag313@gmail.com
- **GitHub**: [g4ever81](https://github.com/g4ever81)

---

Thank you for checking out the Flickr Search App! 🚀

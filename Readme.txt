Mobile App Coding Test
This contains a Flutter mobile application developed as part of a coding test. The application integrates with various social login providers, fetches hotel data from a JSON endpoint, and displays it in a list view. Users can view detailed information about each hotel and navigate to a map view from the detail screen.
 Functional Requirements:
     1.	Login View:
            o	Integrates with Google OAuth for login using Firebase Authentication.
            o	Records the login process (excluding passwords).
    2.	List View:
            o	Fetches hotel data from hotels.json.
            o	Displays hotel data in a table view with Image, Title, and Address.
    3.	Detail View and Map View:
        o	Shows detailed information (image, title, description) of a selected hotel.
        o	Includes a button to navigate to the Map View showing the hotel's location.


 How to Use:
    1.	Setup:
        o	Download the project ZIP file from Google Drive and unzip it.
        o	Open the project in your preferred IDE (e.g., VS Code or Android Studio).
        o	Run flutter pub get in the terminal to install dependencies.

     2.	Running the App: 
        o	Connect your device or start an emulator.
        o	Launch the app by running flutter run.

     3.	Using the App:
        o	Click on "Sign in with Google" and complete the login process.
        o	After logging in, you will see a list of hotels.
        o	Tap on any hotel to view its details.
        o	Tap the map icon in the top-right corner to view the hotel's location on a map.

 Project Structure:
    •	main.dart: Entry point of the application. Initializes Firebase and manages app navigation.
    •	login_screen.dart: Implements Google OAuth login functionality using Firebase Authentication.
    •	hotel_list_screen.dart: Fetches and displays a list of hotels from the provided JSON endpoint.
    •	hotel_detail_screen.dart: Displays detailed information about a selected hotel and provides navigation to the map   view.
    •	map_view.dart: Displays a map view using Flutter Map and OpenStreetMap tiles, showing the location of the selected hotel.
    •	hotel_service.dart: Handles HTTP requests to fetch hotel data from the JSON endpoint.
    •	hotel.dart: Defines the Hotel class to model hotel data fetched from the API.
 
Video Recording:
    A video demonstrating the app's functionality (login process, list view, detail view, and map view) is available in the recordings folder.

Libraries Used:
    •	firebase_core: For initializing Firebase.
    •	firebase_auth: For Firebase authentication.
    •	google_sign_in: For Google Sign-In integration.
    •	http: For making HTTP requests to fetch hotel data.
    •	flutter_map: For displaying maps.
    •	latlong2: For geographical coordinates.
    •	cached_network_image: For caching network images.
 
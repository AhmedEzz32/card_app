# Card App

A Flutter-based digital membership card application that allows users to register, generate QR-coded membership cards, and scan/verify memberships.

## Features

- **User Registration**: Register with name and contact information (email or mobile).
- **Membership Card Generation**: Automatically creates a unique membership ID and expiration date.
- **QR Code Display**: Shows a scannable QR code containing membership details.
- **QR Code Scanning**: Scan and verify the validity of membership QR codes.
- **Local Storage**: Stores memberships using SharedPreferences.
- **Animated UI**: Includes animations for better user experience in scanning and card display.

## Setup

1. Ensure Flutter SDK is installed (version 3.0 or higher recommended).
2. Clone or download the project.
3. Run `flutter pub get` to install dependencies.
4. For Android: Camera permissions are configured in `AndroidManifest.xml`.
5. For iOS: Camera usage is described in `Info.plist`.

## Running the App

- Connect an Android/iOS device or start an emulator/simulator.
- Run `flutter run` to launch the app.

## Building the App

- For Android APK: `flutter build apk`
- For iOS (on Mac): `flutter build ios`

## Usage

1. **Registration**: On first launch, enter your name and contact details to register.
2. **View Card**: See your membership details, including a QR code for sharing.
3. **Scan QR**: Use the scan feature to verify other members' QR codes.
4. **Database View**: Access the floating action button to view all registered memberships.

## Dependencies

- `qr_flutter`: Generates QR codes.
- `mobile_scanner`: Handles QR code scanning.
- `shared_preferences`: Manages local data storage.
- `intl`: Formats dates.
- `uuid`: Generates unique identifiers (optional).

## Screenshots

(Add screenshots here if available)

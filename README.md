# Card App

A Flutter-based digital membership card application that allows users to register, generate QR-coded membership cards, and scan/verify memberships.

## Features

- **User Registration**: Register with name and contact information (email or mobile).
- **Membership Card Generation**: Automatically creates a unique membership ID and expiration date.
- **QR Code Display**: Shows a scannable QR code containing membership details.
- **QR Code Scanning**: Scan and verify the validity of membership QR codes.
- **Local Storage**: Stores memberships using SharedPreferences.
- **Animated UI**: Includes animations for better user experience in scanning and card display.

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
<img src="https://github.com/user-attachments/assets/255ffd00-12b6-4789-9f41-ec8fc6acd551" width="220"/>
<img src="https://github.com/user-attachments/assets/f1c623b7-fc77-4150-bc9b-3cf043b34063" width="220"/>
<img src="https://github.com/user-attachments/assets/c212aa66-2462-40bf-8c40-c269e2ef65e9" width="220"/>
<img src="https://github.com/user-attachments/assets/526515ee-da40-4d2b-b3d6-02fddd022cc0" width="220"/>

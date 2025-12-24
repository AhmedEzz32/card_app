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

<img src="https://github.com/user-attachments/assets/7270eeb0-cfa3-4001-a230-8019791e5262" width="250"/>
<img src="https://github.com/user-attachments/assets/dc293c86-04c1-4f12-b3ad-e03884963546" width="250"/>
<img src="https://github.com/user-attachments/assets/2179fea8-33df-43a9-934f-f28ab3a22adf" width="250"/>
<img src="https://github.com/user-attachments/assets/88cbe582-0422-4ec9-ba2c-a0eb0dad81b7" width="250"/>

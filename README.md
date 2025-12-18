# 🛒 Grocery Delivery App

A robust, cross-platform mobile application for grocery delivery, built with **Flutter** and powered by **Firebase**.

This project demonstrates a full-stack implementation including dynamic cloud data fetching, user authentication, cart state management, and a modern responsive UI.

---

## ✨ Features

*   **☁️ Cloud-Powered Catalog**: fetching simulation of real-time product data (prices, images, descriptions) from **Firebase Firestore**.
*   **🔐 User Authentication**: Secure Sign-Up, Sign-In, and Sign-Out functionality using **Firebase Auth**.
*   **🛒 Smart Cart**: Add items, customize quantity, and manage orders with an in-memory shopping cart.
*   **🌙 Dark/Light Mode**: Fully theme-aware UI that adapts to user preference.
*   **💳 Payment Simulation**: Integrated credit card form and receipt generation.
*   **📱 Responsive Design**: Beautiful Material Design UI that works on iOS, Android, and Web.

---

## 🛠️ Tech Stack

*   **Frontend**: Flutter (Dart)
*   **Backend**: Firebase (BaaS)
    *   **Firestore**: NoSQL Database for products.
    *   **Authentication**: Email/Password login.
*   **State Management**: `provider` pattern.
*   **Architecture**: Service-Repository pattern separating UI from Business Logic.

---

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK installed.
*   A Firebase Project (for your own database).

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/LasriWafa/GroceryAppProject.git
    cd grocery-app
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Firebase Setup**:
    *   Create a project on [Firebase Console](https://console.firebase.google.com/).
    *   Enable **Authentication** (Email/Password).
    *   Enable **Firestore Database** (Start in Test-Mode or allow public read/write rules).
    *   Update `lib/firebase_options.dart` with your project keys.

4.  **Run the App**:
    ```bash
    flutter run
    ```

### 📦 Database Seeding
The app includes a `FirestoreSeeder` to populate your database with initial data (Products, Images, Prices).
*   *Note*: The seeder runs automatically on the first launch if configured in `main.dart`.

---

## 📂 Project Structure

```
lib/
├── components/      # Reusable UI widgets (Buttons, TextFields, Tiles)
├── models/          # Data models (Food, CartItem, Restaurant)
├── pages/           # Application screens (Home, Login, Cart, Payment)
├── services/        # Business logic (Auth, Database/API)
│   ├── auth/        # Firebase Auth implementation
│   ├── database/    # Firestore seeding logic
│   └── food/        # Food fetching service
└── main.dart        # App entry point
```

---

## 📷 API Strategy
We switched from public APIs to a **Custom Firebase Backend** to ensure high-quality data and reliable image assets. The app accesses Firestore as a remote API, ensuring a realistic full-stack experience.

---

Made with ❤️ using Flutter.

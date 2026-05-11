# Expense Tracker iOS App

A simple Expense Tracker iOS application built using SwiftUI, SwiftData, and MVVM architecture with offline support and API synchronization.

---

# Features

- Add new expenses
- Edit existing expenses
- Delete expenses
- Mark expenses as Paid or Pending
- Search expenses by category or note
- Filter expenses by:
  - All
  - Paid
  - Pending
- Local data persistence using SwiftData
- Offline support
- API synchronization
- Duplicate prevention during sync
- Reusable SwiftUI components
- Swipe actions for edit/delete/toggle

---

# Architecture

This project follows MVVM architecture.

## Structure

```text
Models
Views
ViewModels
Services
Components
```

### Models
Handles data structures and SwiftData models.

### Views
Contains all SwiftUI screens.

### ViewModels
Handles business logic and filtering.

### Services
Handles API calls and synchronization logic.

### Components
Reusable UI components.

---

# Technologies Used

- Swift
- SwiftUI
- SwiftData
- MVVM Architecture
- URLSession
- Fake Store API

---

# API Used

Fake Store API

https://fakestoreapi.com/products

The API data is mapped into local expense models and stored using SwiftData.

---

# Offline Support

After the first successful API synchronization:

- Expenses are stored locally using SwiftData
- Users can continue using the app without internet
- Local changes persist after app restart

---

# Synchronization Logic

- Fetches remote data from API
- Maps API response into local Expense model
- Prevents duplicate records using unique IDs
- Stores synced data locally

---

# Screens

- Expense List Screen
- Add/Edit Expense Screen

---

# UI Features

- Modern SwiftUI interface
- Swipe to edit
- Swipe to delete
- Toggle payment status
- Searchable expense list
- Filter buttons near search bar

---

# Local Storage Choice

SwiftData was used because:

- Easy integration with SwiftUI
- Automatic UI updates
- Built on top of SQLite
- Simplifies local persistence handling

---

# Setup Instructions

1. Clone the repository

```bash
git clone https://github.com/MubashirPM/Expense-Tracker-.git
```

2. Open the project in Xcode

3. Run the application on Simulator or Physical Device

---

# Requirements

- Xcode 16+
- iOS 17+
- Swift 5+

---

# Author

Mubashir PM

# Shop App — Flutter

[📥 Download Android APK (app-release.apk)](app-release.apk)

A clean Flutter shopping app with two screens, search, category filtering, and a simple cart action.

---

## Project Structure

```text
flutter_product_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── product.dart              # Product model + sample product data
│   ├── product_list_screen.dart  # Screen 1: list + search + category filter
│   └── product_detail_screen.dart # Screen 2: product detail + quantity + add to cart
├── pubspec.yaml
└── test/
	└── widget_test.dart
```

---

## Features

- Two-screen shopping UI
- Live search on the product list
- Category filter chips
- Product detail page with price, rating, and description
- Quantity selector on the detail screen
- Add to cart snackbar action
- Favourite toggle
- Offline-ready local sample data

---

## Setup

### 1. Get packages

```bash
flutter pub get
```

### 2. Run the app

```bash
flutter run
```

The app uses local sample data defined in `lib/product.dart`, so no backend setup is required.

---

## How It Works

- `main.dart` starts the app and loads `ProductListScreen`.
- `product_list_screen.dart` shows all products, search, and category filters.
- `product_detail_screen.dart` shows product details, lets you change quantity, and triggers an add-to-cart snackbar.
- `product.dart` contains the `Product` model and the built-in product list.

---

## Notes

- This project is currently frontend-only.
- If you want to connect it to a backend later, `lib/product.dart` can be replaced with API data.
- The default Flutter test file is still the starter template and can be updated to match this app.

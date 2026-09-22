# RAGShield — Mobile App

The Flutter mobile client for **RAGShield**, a secured AI assistant built on RAG (Retrieval-Augmented Generation), designed to protect against data leakage and prompt injection attacks.

## 🎨 Design

UI/UX designs are available on Figma:
[RAGShield UI](https://www.figma.com/design/eBoVthUt1xd8TMVdrMeAO7/UI?node-id=1-2&t=jg5fkfaQQPi7ygZi-0)

## Features

- User authentication (login, forgot password, email OTP verification)
- AI chat interface for the secured RAG assistant
- Light/Dark theme support
- English / Arabic localization

## Tech Stack

- **Flutter** — cross-platform mobile framework
- **Provider** — state management
- **easy_localization** — multi-language support (English / Arabic)
- **flutter_screenutil** — responsive UI across different screen sizes
- **google_fonts** — custom typography
- **shared_preferences** — local persistence (e.g. onboarding state)
- **flutter_native_splash** — native splash screen
- **Pinput** / **pin_code_fields** — OTP input fields

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- A connected device or emulator

### Installation

```bash
# Clone the repository
git clone <repo-url>
cd safe_rag

# Install dependencies
flutter pub get

# Run the app
flutter run
```

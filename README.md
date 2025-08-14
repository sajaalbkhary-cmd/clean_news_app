# clean_news_app

# Flutter News App - Clean Architecture

## 📌 Project Description
A news application built with Flutter using Clean Architecture, BLoC pattern, and SOLID principles. The app fetches top headlines from a news API and displays them in a user-friendly interface.

## 🏗️ Folder Structure

ib/
├── core/
│ ├── utils/
│ │ └── api_constants.dart
│ └── network/
│ └── dio_client.dart
├── features/
│ └── news/
│ ├── data/
│ │ ├── datasources/
│ │ │ └── news_remote_data_source.dart
│ │ ├── models/
│ │ │ └── article_model.dart
│ │ └── repositories/
│ │ └── news_repository_impl.dart
│ ├── domain/
│ │ ├── entities/
│ │ │ └── article.dart
│ │ ├── repositories/
│ │ │ └── news_repository.dart
│ │ └── usecases/
│ │ ├── get_news.dart
│ │ └── get_top_headlines.dart
│ └── presentation/
│ ├── bloc/
│ │ ├── news_bloc.dart
│ │ ├── news_event.dart
│ │ └── news_state.dart
│ ├── pages/
│ │ ├── news_detail_page.dart
│ │ ├── news_list_page.dart
│ │ └── news_page.dart
│ └── widgets/
│ └── news_item.dart
└── main.dart

## 🧩 Clean Architecture Layers
1. **Data Layer**:
   - `NewsRemoteDataSource`: Fetches data from API.
   - `NewsRepositoryImpl`: Implements the repository interface.
2. **Domain Layer**:
   - `Article`: Entity class.
   - `GetNews`: Use case for fetching news.
3. **Presentation Layer**:
   - `NewsBloc`: Manages state.
   - `NewsListPage`: Displays news list.

## 🔧 SOLID Principles Applied
- **Single Responsibility**: Each class has one purpose (e.g., `NewsBloc` handles state).
- **Open/Closed**: Easy to extend (e.g., add new data sources).
- **Liskov Substitution**: `NewsRepositoryImpl` replaces `NewsRepository` seamlessly.
- **Interface Segregation**: Small interfaces (e.g., `NewsRepository`).
- **Dependency Inversion**: Depend on abstractions (e.g., `GetNews` depends on `NewsRepository`).

## 🛠️ Design Patterns
- **BLoC**: State management.
- **Repository**: Abstracts data sources.
- **Dependency Injection**: `DioClient` injected into `NewsRemoteDataSource`.

## 🚀 How to Run
1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/flutter-news-app.git

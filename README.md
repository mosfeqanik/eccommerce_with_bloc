# Flutter eCommerce App with BLoC & Pagination

A Flutter-based eCommerce mobile application demonstrating Clean Architecture with Flutter BLoC, Dio HTTP client, and infinite scroll pagination. The app fetches product data from DummyJSON
API and displays it in a list view with pull-to-refresh and loading indicators

## Key Features:

Flutter version 3.32.2 • channel stable
- Fetch products from `https://dummyjson.com/products?limit=10&page=X`

- Clean Architecture: separation of presentation, domain, and data layers

- `BLoC Pattern` for state management

- Infinite Scroll Pagination with page tracking

- Pull-to-refresh support

- Loading indicators while fetching data

- ListView with product images, title, and price

Easy to extend for categories, search, and filters
### Screen record

### Folder Structure:
```lib/
├─ core/
│  └─ network/
│      ├─ dio_client.dart
│      └─ logging_interceptor.dart
├─ data/
│  ├─ datasources/
│  │   └─ product_remote_datasource.dart
│  ├─ models/
│  │   └─ product_model.dart
│  └─ repositories/
│      └─ product_repository_impl.dart
├─ domain/
│  ├─ entities/
│  │   └─ product.dart
│  └─ repositories/
│      └─ product_repository.dart
├─ presentation/
│  ├─ bloc/
│  │   ├─ product_bloc.dart
│  │   ├─ product_event.dart
│  │   └─ product_state.dart
│  └─ pages/
│      └─ products_page.dart
└─ main.dart
```
## Getting Started

To run the project locally, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/todo-sensor-app.git
    ```

2. Install the dependencies:
    ```bash
    flutter pub get
    ```

3. Run the app:
    ```bash
    flutter run
    ```


##Dependencies:

- flutter_bloc

- bloc_concurrency

- dio

- stream_transform

##API Endpoint:

```bash 
https://dummyjson.com/products?limit=10&page=1
```

##ScreenShots of application

<br /> 
<img align="left" alt="screenrecord" width="360px" src="https://github.com/mosfeqanik/eccommerce_with_bloc/blob/main/screenrecord.gif" />

<br />

<br>


##Author:
Md. Mosfeq Anik
# Floor Stream Demo (Flutter + Riverpod)

This project is a practical experiment to better understand how **Streams work with Floor** (a SQLite persistence library for Flutter) and how to use both **StreamProvider** and **AsyncNotifierProvider** with Riverpod.

## 🎯 Goals

- Observe how Floor emits changes reactively using DAOs that return `Stream<List<T>>`.
- Compare `StreamProvider` and `AsyncNotifierProvider` for managing data in Flutter.
- Explore how inheritance affects data modeling and UI logic.
- Analyze how to structure reactive screens based on different data sources.

## 📦 Project Structure

This app defines two main entities:

- `Teacher`: a simple class with no inheritance.
- `TeacherExtends`: a class that **extends** a base `User` class.

For each entity, the app includes 3 screens:

### 1. **Search Screen**
- Contains a search bar to filter teachers by name.
- Uses `StreamProvider` to reactively display results as Floor emits data changes.

### 2. **List with Stream Screen**
- Shows a list of teachers that updates in real time.
- Includes a `FloatingActionButton` to add new teachers.
- Powered by a `StreamProvider` that listens to the Floor DAO.

### 3. **List with AsyncNotifier Screen**
- Shows a list of teachers using an `AsyncNotifier`.
- This list **does not update automatically** when new teachers are added.
- The notifier loads data only once via a `Future` when initialized.
- Designed to contrast with the real-time behavior of the `StreamProvider` screen.

> 🧪 This setup allows you to clearly see how `StreamProvider` reacts to database changes while `AsyncNotifier` requires explicit state updates.

## 🧩 Architecture and UI

The app uses a side drawer menu that lets you switch between:

- Screens for `Teacher`
- Screens for `TeacherExtends`

Although much of the code could be reused (e.g. through inheritance or extensions), the UI was deliberately split to highlight differences between a simple class and an inherited one.

## 🚀 Technologies & Packages

- **Flutter**
- **Floor** – SQLite persistence
- **Riverpod** – state management

## 📈 Key Learnings

This project acts as a sandbox to understand:

- When to use `StreamProvider` for live updates
- When `AsyncNotifier` is more appropriate
- How Floor manages data reactivity through DAO streams
- How inheritance impacts model structure and UI implementation

## 🧠 Purpose

This project is intended as a personal learning tool and technical demo. It’s not a production-ready app, but a minimal and focused experiment on reactive data handling in Flutter using Floor and Riverpod.

## 📂 Folder Structure
> ℹ️ This project includes generated files like `database.g.dart` for ease of use and to avoid running code generation manually.
```
lib
├── application
├── data
│   ├── datasources
│   │   └── db
│   │       ├── dao
│   │       │   ├── teacher_dao.dart
│   │       │   └── teacherextends_dao.dart
│   │       ├── database.dart
│   │       ├── database.g.dart
│   │       └── database_service.dart
│   └── repository
│       ├── teacher_db.dart
│       └── teacherextends_db.dart
├── domain
│   ├── entities
│   │   ├── teacher.dart
│   │   └── teacher_extends.dart
│   └── models
│       └── user.dart
├── main.dart
├── presentation
│   ├── providers
│   │   ├── database.dart
│   │   ├── teacher
│   │   │   ├── teacher_async_notifier.dart
│   │   │   ├── teacher_repository.dart
│   │   │   └── teacher_stream.dart
│   │   └── teacherextends
│   │       ├── teacherext_async_notifier.dart
│   │       ├── teacherext_repository.dart
│   │       └── teacherext_stream.dart
│   ├── screens
│   │   ├── form.dart
│   │   ├── home_drawer.dart
│   │   ├── teacher
│   │   │   ├── teacher_async.dart
│   │   │   ├── teacher_list.dart
│   │   │   ├── teacher_search.dart
│   │   │   └── teacher_stream.dart
│   │   └── teacherextends
│   │       ├── teacherext_async.dart
│   │       ├── teacherext_list.dart
│   │       ├── teacherext_search.dart
│   │       └── teacherext_stream.dart
│   └── widgets
│       ├── navigation_bar.dart
│       ├── save_form_button.dart
│       ├── search_bar.dart
│       └── teacher_widget.dart
└── shared
    └── utils
        └── constants.dart
```

### ✨ Want to contribute?

Pull requests, ideas, or feedback are welcome!

# Floor Stream Demo (Flutter + Riverpod)

Aquest projecte és una prova per entendre millor com funcionen els **Streams amb Floor** i les diferències entre **StreamProvider** i **AsyncNotifierProvider** amb Riverpod.

## 🎯 Objectius

- Comprovar com Floor emet canvis reactius usant DAOs que retornen `Stream<List<T>>`.
- Comparar el comportament entre `StreamProvider` i `AsyncNotifierProvider`.
- Explorar la diferència entre models amb i sense herència a nivell de dades i interfície.
- Analitzar com es poden estructurar pantalles que reaccionen a dades en temps real.

## 📦 Estructura del projecte

El projecte conté dues entitats principals:

- `Teacher`: una classe simple sense herència.
- `TeacherExtends`: una classe que hereta de `User`.

Per a cada entitat hi ha 3 pantalles:

### 1. Pantalla de **Search**
- Inclou una barra de cerca per filtrar professors pel nom.
- Utilitza `StreamProvider` per mostrar resultats de forma reactiva a mesura que Floor emet canvis.

### 2. Pantalla de **Llista amb Stream**
- Mostra una llista de professors actualitzada en temps real.
- Té un `FloatingActionButton` per afegir nous professors.
- Es basa en un `StreamProvider` connectat al DAO de Floor.

### 3. Pantalla de **Llista amb AsyncNotifier**
- Mostra una llista de professors, però **no** s’actualitza automàticament.
- El `AsyncNotifier` només carrega dades en la inicialització via `Future`.
- Permet comparar amb la pantalla basada en `StreamProvider`.

> 🧪 Això permet veure clarament com `StreamProvider` reacciona als canvis a la base de dades, mentre que `AsyncNotifier` necessita una actualització manual.

## 🧩 Arquitectura i UI

El drawer de l'aplicació permet escollir entre:

- UI basada en `Teacher`
- UI basada en `TeacherExtends`

Tot i que es podria haver fet reutilització de codi, s'ha optat per mantenir les pantalles separades per fer evident la diferència entre una classe simple i una amb herència.

## 🚀 Tecnologies i paquets

- **Flutter**
- **Floor** – per a persistència amb SQLite
- **Riverpod** – per a gestió d'estat

## 📝 Conclusions

Aquest projecte serveix com a sandbox per entendre:

- Quan és millor fer servir `StreamProvider`
- Quan té sentit controlar l’estat amb `AsyncNotifier`
- Com Floor gestiona reactivitat amb DAOs
- Com estructurar models amb i sense herència

## 📂 Estructura de carpetes
> ℹ️ Este projecte inclou arxius generats com `database.g.dart` per facilitat i per a evitar executar generació de codi manualment.
```
lib
├── application
├── data
│   ├── datasources
│   │   └── db
│   │       ├── dao
│   │       │   ├── teacher_dao.dart
│   │       │   └── teacherextends_dao.dart
│   │       ├── database.dart
│   │       ├── database.g.dart
│   │       └── database_service.dart
│   └── repository
│       ├── teacher_db.dart
│       └── teacherextends_db.dart
├── domain
│   ├── entities
│   │   ├── teacher.dart
│   │   └── teacher_extends.dart
│   └── models
│       └── user.dart
├── main.dart
├── presentation
│   ├── providers
│   │   ├── database.dart
│   │   ├── teacher
│   │   │   ├── teacher_async_notifier.dart
│   │   │   ├── teacher_repository.dart
│   │   │   └── teacher_stream.dart
│   │   └── teacherextends
│   │       ├── teacherext_async_notifier.dart
│   │       ├── teacherext_repository.dart
│   │       └── teacherext_stream.dart
│   ├── screens
│   │   ├── form.dart
│   │   ├── home_drawer.dart
│   │   ├── teacher
│   │   │   ├── teacher_async.dart
│   │   │   ├── teacher_list.dart
│   │   │   ├── teacher_search.dart
│   │   │   └── teacher_stream.dart
│   │   └── teacherextends
│   │       ├── teacherext_async.dart
│   │       ├── teacherext_list.dart
│   │       ├── teacherext_search.dart
│   │       └── teacherext_stream.dart
│   └── widgets
│       ├── navigation_bar.dart
│       ├── save_form_button.dart
│       ├── search_bar.dart
│       └── teacher_widget.dart
└── shared
    └── utils
        └── constants.dart
```
## 🧠 Inspiració

El projecte ha estat dissenyat com a eina d’aprenentatge i exploració personal. No pretén ser una aplicació completa, sinó una base per entendre millor les eines i patrons.

---

### ✨ Vols col·laborar?

Les millores, idees o pull requests són benvingudes!
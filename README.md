# Quran App 📖

A full-featured **Quran mobile application** developed using **Flutter** with a clean **MVVM architecture**, connected to a custom **Java Spring Boot API** backend.

## 🕌 Features

- 🧾 List of all Surahs (Chapters)
- 📜 View Ayahs (Verses) of each Surah
- 🔍 Search Surahs by name
- 🌙 Light/Dark theme toggle
- ⚙️ Local caching with Hive (optional)
- 📡 Connected to custom API built with Spring Boot

## 🧠 Architecture

- Follows **MVVM** (Model-View-ViewModel) architecture
- Uses **Cubit/Bloc** for state management
- API layer handled via **Dio + Retrofit**

## 🔧 Backend (Java Spring Boot)

- RESTful API built with **Spring Boot**
- Exposes endpoints for:
  - Surah list
  - Ayah list per Surah
  - Search/filter
- Token-based or public access depending on config

## 🧰 Tech Stack

### Frontend (Flutter)
- Flutter
- MVVM
- Cubit
- Dio + Retrofit
- Hive (optional for local storage)

### Backend (Spring Boot)
- Java 17+
- Spring Web
- Spring Security (optional)
- JPA / Hibernate
- PostgreSQL or H2

## 🗂️ Clean Project Structure


# 📈 AI-Powered Stock Analysis App

A cross-platform Flutter application integrated with a Django REST API backend that leverages AI to predict stock trends, analyze market sentiment, and manage user portfolios in real time.

---

## 🚀 Features

### 🔹 Frontend (Flutter)
- **Real-Time Stock Market Data**
- **AI-Powered Price Predictions** (Linear Regression based)
- **Portfolio Management**
- **News & Sentiment Analysis**
- **Modern Dark Themed UI**
- **JWT Authentication & Profile Management**

### 🔹 Backend (Django REST Framework)
- **JWT Authentication**
- **Stock Data API with Yahoo Finance**
- **Historical Data & AI Price Prediction**
- **User Portfolio API**
- **News Fetching & Sentiment Analysis using NLTK**

---

## 📱 Screens (Flutter)
- **Home Page:** Market trends, AI insights, news
- **Portfolio Page:** Add/remove/update stocks, track performance
- **News & Sentiment Page:** Latest stock news with sentiment labels
- **Settings & Profile Page:** Account details, dark mode, logout

---

## 🧠 AI Capabilities
- **Model:** Linear Regression using `scikit-learn`
- **Data Source:** Yahoo Finance API (`yfinance`)
- **Prediction:** Next-day stock price forecast
- **Future Upgrade:** Integrate LSTM or Prophet for time-series forecasting

---

## 🔒 Authentication
- **JWT Token-Based Authentication**
- **Secure API endpoints**
- **Custom User Model (username, email, password)**

---

## 🔧 Tech Stack

| Layer       | Technology                    |
|-------------|-------------------------------|
| Frontend    | Flutter (Dart)                |
| Backend     | Django + Django REST Framework|
| AI/ML       | Python, scikit-learn          |
| Data APIs   | Yahoo Finance, NewsAPI        |
| Sentiment   | NLTK, VADER                   |
| Auth        | JWT                           |
| DB          | SQLite (dev), PostgreSQL (prod)|
| Deployment  | Heroku / AWS (optional)       |

---

## 📂 Project Structure


# 🗳️ Voting App — Приложение для опросов и голосований

Мобильное приложение для создания и проведения опросов/голосований с push-уведомлениями, AI-генерацией вопросов и админ-панелью.

## Возможности

- **Регистрация и авторизация** — email/пароль через Supabase Auth, смена и восстановление пароля
- **Создание опросов** — вопрос с вариантами ответов (Да/Нет или кастомные), дедлайн
- **Голосование** — одноразовое голосование с отслеживанием участников
- **AI-генерация** — создание вопросов через DeepSeek (OpenRouter API)
- **Push-уведомления** — уведомления о новых опросах через OneSignal
- **Модерация** — запрещённые вопросы, фильтрация контента
- **Профиль** — управление аккаунтом, удаление профиля
- **Админ-панель** — управление пользователями, опросами и настройками

## Архитектура

```
lib/
├── auth/                      # Авторизация (Supabase Auth)
├── backend/
│   ├── api_requests/          # API: ЮKassa, DeepSeek, Edge Functions
│   └── supabase/              # Таблицы БД
├── custom_code/
│   ├── actions/               # Push-уведомления, авторизация, почта
│   └── widgets/               # Выбор телефонного номера
├── home_page/                 # Главная — лента опросов
├── create_anketa/             # Создание опроса
├── question/                  # Экран голосования
├── forbidden_questions/       # Модерация контента
├── admin_panel/               # Админ-панель
├── profile/                   # Профиль пользователя
└── flutter_flow/              # Утилиты, тема, навигация
```

## Стек технологий

- **Flutter** — кроссплатформенный UI
- **FlutterFlow** — визуальное построение UI и навигации
- **Supabase** — база данных (PostgreSQL), авторизация, Edge Functions
- **OneSignal** — push-уведомления
- **DeepSeek / OpenRouter** — AI-генерация вопросов для опросов
- **ЮKassa** — приём платежей

## База данных

| Таблица | Описание |
|---------|----------|
| `anketaSap` | Опросы: вопрос, варианты, ответы, дедлайн, автор |
| `users` | Пользователи: email, телефон, OneSignal ID |
| `users_sem` | Расширенные данные пользователей |
| `notifications` | Уведомления |
| `tombstone_sem` | Архив удалённых записей |
| `global` | Глобальные настройки |

## Custom Actions

| Файл | Описание |
|------|----------|
| `get_one_signal_player_id.dart` | Получение OneSignal Player ID для push-уведомлений |
| `register_push_listener.dart` | Регистрация слушателя push-уведомлений |
| `onesignal_permission.dart` | Запрос разрешения на уведомления |
| `send_mail_order.dart` | Отправка email-уведомлений |
| `delete_user_action.dart` | Удаление аккаунта |
| `change_password_action.dart` | Смена пароля |
| `reset_password.dart` | Восстановление пароля |

## Custom Widgets

| Файл | Описание |
|------|----------|
| `phone_number_picker.dart` | Виджет ввода номера телефона с выбором страны |

## Запуск

```bash
flutter pub get
flutter run
```

Требуется настроить:
- Supabase URL и Anon Key в `lib/backend/supabase/supabase.dart`
- OneSignal App ID
- OpenRouter API Key
- Ключ ЮKassa

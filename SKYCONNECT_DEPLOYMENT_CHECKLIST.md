# SkyConnect Deployment Checklist ✅

## 🚀 Перед началом сборки

### ✅ Обязательные шаги
- [ ] **Создать реальные иконки** - заменить все placeholder файлы
- [ ] **Настроить .env файл** - скопировать env.example и заполнить
- [ ] **Проверить домены** - убедиться что bsky.app домены работают
- [ ] **Настроить сертификаты** - iOS и Android signing

## 📱 Сборка приложения

### 1. Установка зависимостей
```bash
yarn install
```

### 2. Настройка окружения
```bash
cp env.example .env
# Отредактировать .env с вашими значениями
```

### 3. Локальная разработка
```bash
# Запуск dev сервера
yarn start

# Запуск на iOS
yarn ios

# Запуск на Android  
yarn android
```

### 4. Сборка для продакшена
```bash
# Сборка всех платформ
yarn build-skyconnect

# Только iOS
yarn build-skyconnect:ios

# Только Android
yarn build-skyconnect:android
```

## 🎨 Визуальные ассеты (КРИТИЧНО)

### Иконки которые нужно создать:
- `assets/app-icons/android_icon_skyconnect.png` - 192x192px
- `assets/app-icons/ios_icon_skyconnect.png` - 1024x1024px  
- `assets/icon-skyconnect-foreground.png` - 108x108dp
- `assets/icon-skyconnect-monochrome.png` - 108x108dp
- `assets/icon-skyconnect-notification.png` - 24x24dp

### Splash экраны:
- `assets/splash/skyconnect-splash-light.png` - светлый theme
- `assets/splash/skyconnect-splash-dark.png` - темная theme
- `assets/splash/android-skyconnect-logo-white.png` - Android logo

## 🔧 Конфигурация

### Package IDs:
- **iOS**: `app.skyconnect`
- **Android**: `app.skyconnect`
- **Extensions**: `app.skyconnect.*`

### Домены (сохранены):
- `bsky.app` - основной
- `staging.bsky.app` - тестовый
- `api.bsky.app` - API

### Цвета:
- **Primary**: `#0066FF`
- **Secondary**: `#FFFFFF`
- **Splash Light**: `#A8CCFF`
- **Splash Dark**: `#00398A`

## 📦 Store подготовка

### iOS App Store:
1. [ ] Создать App Store Connect аккаунт
2. [ ] Зарегистрировать Bundle ID: `app.skyconnect`
3. [ ] Настроить provisioning profiles
4. [ ] Создать сертификаты
5. [ ] Настроить App Store Connect listing

### Google Play Store:
1. [ ] Создать Google Play Console аккаунт
2. [ ] Зарегистрировать package: `app.skyconnect`
3. [ ] Настроить signing key
4. [ ] Создать store listing
5. [ ] Настроить content rating

## 🧪 Тестирование

### Функциональное тестирование:
- [ ] Запуск приложения
- [ ] Регистрация/логин
- [ ] Создание постов
- [ ] Просмотр ленты
- [ ] Профили пользователей
- [ ] Уведомления
- [ ] Deep linking

### UI тестирование:
- [ ] Адаптация под разные размеры экранов
- [ ] Темная/светлая тема
- [ ] Иконки отображаются корректно
- [ ] Splash экраны работают
- [ ] Навигация

### Техническое тестирование:
- [ ] Build проходит без ошибок
- [ ] Нет крэшей при запуске
- [ ] Память используется адекватно
- [ ] Сеть работает корректно
- [ ] Push уведомления

## 🚨 Распространенные проблемы

### Build ошибки:
1. **Missing icons** - создать все иконки
2. **Bundle ID conflict** - использовать уникальный ID
3. **Certificate issues** - настроить сертификаты
4. **Dependency conflicts** - `yarn install`

### Runtime ошибки:
1. **Network issues** - проверить API endpoints
2. **Auth problems** - проверить конфигурацию
3. **Missing assets** - добавить все ассеты

## 📋 Финальный чеклист перед релизом

### Код:
- [ ] Все bundle IDs обновлены
- [ ] Домены корректны
- [ ] API endpoints работают
- [ ] Environment variables настроены
- [ ] Нет hardcoded значений

### Ассеты:
- [ ] Все иконки созданы
- [ ] Splash экраны готовы
- [ ] Адаптивные иконки
- [ ] Notification иконки

### Конфигурация:
- [ ] EAS build profiles настроены
- [ ] Сертификаты готовы
- [ ] Store listings созданы
- [ ] Privacy policy готов

### Тестирование:
- [ ] Успешная сборка
- [ ] Приложение запускается
- [ ] Основной функционал работает
- [ ] Нет крэшей

## 🎯 Успешный деплой!

Когда все пункты выполнены:

1. **Собрать финальную версию**
2. **Загрузить в stores**
3. **Опубликовать**
4. **Мониторить отзывы**

---

**SkyConnect готов к полному развертыванию!** 🚀✨

Помните: главное - создать уникальные визуальные ассеты и настроить ваши сертификаты. Остальная техническая часть уже готова.

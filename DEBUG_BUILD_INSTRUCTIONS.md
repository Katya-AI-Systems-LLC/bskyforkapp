# SkyConnect Debug APK Build Instructions

## 📋 Предварительные требования

### 1. Установка Node.js
```bash
# Установить Node.js версии 20 или выше
# Скачать с https://nodejs.org/
node --version  # должно быть v20.x.x или выше
```

### 2. Установка Yarn
```bash
npm install -g yarn
yarn --version
```

### 3. Android Studio и SDK
- Установить Android Studio
- Настроить Android SDK
- Установить Android Build Tools
- Создать virtual device или подключить физическое устройство

## 🚀 Генерация Debug APK

### Шаг 1: Установка зависимостей
```bash
cd /path/to/skyconnect-app
yarn install
```

### Шаг 2: Настройка окружения
```bash
# Создать .env файл
cp env.example .env

# Отредактировать .env (минимальная конфигурация)
EXPO_PUBLIC_ENV=development
EXPO_PUBLIC_RELEASE_VERSION=1.0.0
EXPO_PUBLIC_BUNDLE_IDENTIFIER=app.skyconnect
```

### Шаг 3: Запуск Metro bundler
```bash
# В одном терминале
yarn start
```

### Шаг 4: Генерация Debug APK
```bash
# В другом терминале
yarn android:profile
# ИЛИ
npx expo run:android --variant release
```

### Альтернативный метод через EAS
```bash
# EAS Build (требует аккаунт)
npx eas build --platform android --profile development
```

## 🔧 Конфигурация для Debug Build

### AndroidManifest.xml настройки
Приложение уже настроено с:
- Package: `app.skyconnect`
- Debuggable: true
- Min SDK: совместим с современными устройствами

### Build Variants
- `debug` - для разработки
- `release` - для продакшена (требует signing)
- `profile` - оптимизированный debug

## 📱 Установка APK на устройство

### Через ADB
```bash
# После сборки APK будет в:
# android/app/build/outputs/apk/debug/app-debug.apk

# Установка
adb install android/app/build/outputs/apk/debug/app-debug.apk

# Или через gradle
./gradlew assembleDebug
adb install app/build/outputs/apk/debug/app-debug.apk
```

### Через Expo
```bash
# Скан QR код из Metro bundler
# Приложение установится через Expo Go
```

## 🐛 Отладка

### Просмотр логов
```bash
# Логи приложения
adb logcat | grep "SkyConnect"

# React Native логи
npx react-native log-android
```

### Debug меню
- Устройство: Shake device или Cmd+M
- Эмулятор: Cmd+M или Ctrl+M
- Опции: Reload, Debug JS Remotely, Inspector

## ⚠️ Возможные проблемы и решения

### 1. "command not found: yarn"
```bash
npm install -g yarn
# ИЛИ использовать npx
npx yarn install
```

### 2. Android SDK не найден
```bash
# Установить ANDROID_HOME
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### 3. Metro bundler не запускается
```bash
# Очистить кэш
npx react-native start --reset-cache
# ИЛИ
yarn start --reset-cache
```

### 4. Build ошибки
```bash
# Очистить проект
cd android
./gradlew clean
cd ..
npx expo run:android --variant debug
```

### 5. Устройство не найдено
```bash
# Проверить подключенные устройства
adb devices

# Запустить эмулятор
emulator -list-avds
emulator -avd <device_name>
```

## 📊 Проверка после установки

### Функциональность для тестирования:
- [ ] Приложение запускается
- [ ] Показывает splash screen SkyConnect
- [ ] Основной экран загружается
- [ ] Навигация работает
- [ ] Иконка приложения - SkyConnect

### Технические проверки:
- [ ] Нет крэшей при запуске
- [ ] Память используется адекватно
- [ ] Сетевые запросы работают
- [ ] UI отображается корректно

## 🎯 Быстрая генерация (если все настроено)

```bash
# Одна команда для debug APK
cd /path/to/skyconnect-app
yarn android:profile

# APK будет здесь:
# android/app/build/outputs/apk/profile/app-profile.apk
```

## 📱 Установка на устройство

```bash
# Установка APK
adb install android/app/build/outputs/apk/profile/app-profile.apk

# Запуск приложения
adb shell am start -n app.skyconnect/.MainActivity
```

---

**SkyConnect Debug APK готов к тестированию!** 🚀

Следуйте этим инструкциям для генерации и установки debug версии приложения.

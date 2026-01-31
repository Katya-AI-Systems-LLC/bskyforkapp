# 🚀 Быстрая генерация Debug APK для SkyConnect

## 📋 Что нужно сделать (3 простых шага)

### Шаг 1: Установка окружения
```bash
# Установить Node.js 20+ с https://nodejs.org/
node --version

# Установить Yarn
npm install -g yarn
```

### Шаг 2: Настройка проекта
```bash
# Перейти в папку проекта
cd /path/to/skyconnect-app

# Запустить автоматический скрипт
# Windows:
build-debug-apk.bat

# Mac/Linux:
chmod +x build-debug-apk.bat
./build-debug-apk.sh
```

### Шаг 3: Готово!
APK будет автоматически собран и установлен на подключенное устройство.

## 🎯 Ручной способ (если скрипты не работают)

```bash
# 1. Установка зависимостей
yarn install

# 2. Генерация Android проекта
npx expo prebuild --clean

# 3. Сборка APK
cd android
./gradlew assembleDebug
cd ..

# 4. Установка
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

## 📱 Где найти APK?

После сборки APK будет здесь:
```
android/app/build/outputs/apk/debug/app-debug.apk
```

## 🔧 Что делает SkyConnect?

- **Package ID**: `app.skyconnect`
- **App Name**: `SkyConnect`
- **Icon**: Голубое облако с линиями связи
- **Primary Color**: `#0066FF`
- **Domains**: Использует bsky.app инфраструктуру

## 🐛 Если что-то пошло не так

### Ошибка "Node.js не найден"
```bash
# Скачать с https://nodejs.org/
# Перезапустить терминал
```

### Ошибка "Android SDK не найден"
```bash
# Установить Android Studio
# Настроить Android SDK
# Добавить в PATH
```

### Ошибка сборки
```bash
# Очистить проект
cd android
./gradlew clean
cd ..
npx expo prebuild --clean
```

### Устройство не найдено
```bash
# Проверить подключенные устройства
adb devices

# Включить отладку по USB на устройстве
```

## 📊 Проверка после установки

После установки APK проверьте:

✅ **Приложение запускается**  
✅ **Показывает splash screen SkyConnect**  
✅ **Основной экран загружается**  
✅ **Иконка приложения - SkyConnect**  
✅ **Навигация работает**  

## 🎉 Результат

Вы получите полностью рабочий SkyConnect debug APK с:
- Уникальным брендингом
- Настроенными package IDs
- Правильными иконками (placeholder)
- Сохраненной функциональностью Bluesky

**SkyConnect готов к тестированию!** 🚀

---

**Быстрый старт:** Запустите `build-debug-apk.bat` (Windows) или `./build-debug-apk.sh` (Mac/Linux) и следуйте инструкциям.

#!/bin/bash

# SkyConnect Debug APK Build Script
# Используйте этот скрипт для быстрой генерации debug APK

echo "🚀 SkyConnect Debug APK Build Script"
echo "=================================="

# Проверка зависимостей
echo "📋 Проверка зависимостей..."

if ! command -v node &> /dev/null; then
    echo "❌ Node.js не установлен. Установите Node.js 20+ с https://nodejs.org/"
    exit 1
fi

if ! command -v yarn &> /dev/null; then
    echo "❌ Yarn не установлен. Установите: npm install -g yarn"
    exit 1
fi

if ! command -v adb &> /dev/null; then
    echo "⚠️  ADB не найден. Убедитесь что Android SDK установлен"
fi

# Установка зависимостей
echo "📦 Установка зависимостей..."
yarn install

if [ $? -ne 0 ]; then
    echo "❌ Ошибка установки зависимостей"
    exit 1
fi

# Настройка окружения
if [ ! -f .env ]; then
    echo "⚙️  Создание .env файла..."
    cp env.example .env
    echo "✅ .env файл создан. Отредактируйте его при необходимости."
fi

# Prebuild (генерация Android проекта)
echo "🔨 Генерация Android проекта..."
npx expo prebuild --clean

if [ $? -ne 0 ]; then
    echo "❌ Ошибка prebuild"
    exit 1
fi

# Сборка debug APK
echo "📱 Сборка Debug APK..."
cd android

# Очистка предыдущих сборок
./gradlew clean

# Сборка debug variant
./gradlew assembleDebug

if [ $? -ne 0 ]; then
    echo "❌ Ошибка сборки APK"
    exit 1
fi

cd ..

# Поиск APK файла
APK_PATH=$(find android/app/build/outputs/apk/debug -name "*.apk" | head -1)

if [ -n "$APK_PATH" ]; then
    echo "✅ Debug APK успешно собран!"
    echo "📂 Путь к APK: $APK_PATH"
    echo "📊 Размер APK: $(du -h "$APK_PATH" | cut -f1)"
    
    # Установка если устройство подключено
    if command -v adb &> /dev/null && adb devices | grep -q "device$"; then
        echo "📲 Установка APK на устройство..."
        adb install "$APK_PATH"
        
        if [ $? -eq 0 ]; then
            echo "✅ APK успешно установлен!"
            echo "🚀 Запуск SkyConnect..."
            adb shell am start -n app.skyconnect/.MainActivity
        else
            echo "⚠️  Ошибка установки APK"
        fi
    else
        echo "📲 Для установки вручную:"
        echo "   adb install $APK_PATH"
    fi
    
    # Открыть папку с APK
    if command -v open &> /dev/null; then
        open "$(dirname "$APK_PATH")"
    elif command -v xdg-open &> /dev/null; then
        xdg-open "$(dirname "$APK_PATH")"
    fi
    
else
    echo "❌ APK файл не найден"
    exit 1
fi

echo ""
echo "🎉 SkyConnect Debug APK готов!"
echo "📱 Приложение: SkyConnect"
echo "📦 Package: app.skyconnect"
echo "🔧 Build Type: Debug"
echo ""

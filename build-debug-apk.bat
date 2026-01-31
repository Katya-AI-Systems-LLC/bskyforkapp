@echo off
REM SkyConnect Debug APK Build Script for Windows
REM Используйте этот скрипт для быстрой генерации debug APK

echo 🚀 SkyConnect Debug APK Build Script
echo ==================================

REM Проверка зависимостей
echo 📋 Проверка зависимостей...

node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js не установлен. Установите Node.js 20+ с https://nodejs.org/
    pause
    exit /b 1
)

yarn --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Yarn не установлен. Установите: npm install -g yarn
    pause
    exit /b 1
)

adb version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  ADB не найден. Убедитесь что Android SDK установлен
)

REM Установка зависимостей
echo 📦 Установка зависимостей...
yarn install

if %errorlevel% neq 0 (
    echo ❌ Ошибка установки зависимостей
    pause
    exit /b 1
)

REM Настройка окружения
if not exist .env (
    echo ⚙️  Создание .env файла...
    copy env.example .env
    echo ✅ .env файл создан. Отредактируйте его при необходимости.
)

REM Prebuild (генерация Android проекта)
echo 🔨 Генерация Android проекта...
npx expo prebuild --clean

if %errorlevel% neq 0 (
    echo ❌ Ошибка prebuild
    pause
    exit /b 1
)

REM Сборка debug APK
echo 📱 Сборка Debug APK...
cd android

REM Очистка предыдущих сборок
call gradlew clean

REM Сборка debug variant
call gradlew assembleDebug

if %errorlevel% neq 0 (
    echo ❌ Ошибка сборки APK
    pause
    exit /b 1
)

cd ..

REM Поиск APK файла
for /f "delims=" %%i in ('dir /s /b android\app\build\outputs\apk\debug\*.apk 2^>nul') do set APK_PATH=%%i

if defined APK_PATH (
    echo ✅ Debug APK успешно собран!
    echo 📂 Путь к APK: %APK_PATH%
    
    REM Установка если устройство подключено
    adb devices | find "device" >nul
    if %errorlevel% equ 0 (
        echo 📲 Установка APK на устройство...
        adb install "%APK_PATH%"
        
        if %errorlevel% equ 0 (
            echo ✅ APK успешно установлен!
            echo 🚀 Запуск SkyConnect...
            adb shell am start -n app.skyconnect/.MainActivity
        ) else (
            echo ⚠️  Ошибка установки APK
        )
    ) else (
        echo 📲 Для установки вручную:
        echo    adb install "%APK_PATH%"
    )
    
    REM Открыть папку с APK
    explorer "%~dp0android\app\build\outputs\apk\debug"
    
) else (
    echo ❌ APK файл не найден
    pause
    exit /b 1
)

echo.
echo 🎉 SkyConnect Debug APK готов!
echo 📱 Приложение: SkyConnect
echo 📦 Package: app.skyconnect
echo 🔧 Build Type: Debug
echo.
pause

# Rebranding Instructions for Social App

This document outlines the complete rebranding process performed on the Bluesky Social app to create "Social App" for official store distribution.

## ✅ Completed Changes

### 1. App Identity
- **Package name**: `bsky.app` → `social-app`
- **App display name**: `Bluesky` → `Social App`
- **App slug**: `bluesky` → `social-app`
- **URL scheme**: `bluesky` → `socialapp`
- **Owner**: `blueskysocial` → `yourcompany`

### 2. Package Identifiers
- **iOS Bundle ID**: `xyz.blueskyweb.app` → `com.yourcompany.socialapp`
- **Android Package**: `xyz.blueskyweb.app` → `com.yourcompany.socialapp`
- **App Groups**: `group.app.bsky` → `group.app.socialapp`

### 3. Extension Bundle IDs
- **Share Extension**: `xyz.blueskyweb.app.Share-with-Bluesky` → `com.yourcompany.socialapp.Share-with-SocialApp`
- **Notifications Extension**: `xyz.blueskyweb.app.BlueskyNSE` → `com.yourcompany.socialapp.SocialAppNSE`
- **App Clip**: `xyz.blueskyweb.app.AppClip` → `com.yourcompany.socialapp.AppClip`

### 4. Domain Configuration
- **Associated Domains**: `bsky.app` → `yourapp.com`
- **Intent Filters**: Updated to use `yourapp.com`
- **Update URL**: `https://updates.bsky.app/manifest` → `https://updates.yourapp.com/manifest`

### 5. API Endpoints
- **Help Desk**: `https://blueskyweb.zendesk.com` → `https://yourcompany.zendesk.com`
- **Download URL**: `https://bsky.app/download` → `https://yourapp.com/download`
- **Metrics API**: `https://events.bsky.app` → `https://events.yourapp.com`
- **Geolocation**: `https://ip.bsky.app` → `https://ip.yourapp.com`
- **Live Events**: `https://live-events.workers.bsky.app` → `https://live-events.workers.yourapp.com`

### 6. Branding Strings
- **App Store Links**: Updated to new package identifiers
- **Starter Pack URLs**: Updated UTM parameters from `bluesky` to `socialapp`
- **Permission Text**: Updated to use "Social App" instead of "Bluesky"

### 7. Documentation
- **README.md**: Updated with new branding and fork information
- **App Store URLs**: Updated with placeholder URLs

## 🔄 Remaining Tasks for Complete Rebranding

### 1. Visual Assets (CRITICAL)
You MUST replace all visual assets with your own custom designs:

**App Icons:**
- `assets/app-icons/android_icon_*.png` - All Android icons
- `assets/app-icons/ios_icon_*.png` - All iOS icons
- `assets/icon-android-foreground.png`
- `assets/icon-android-monochrome.png`
- `assets/icon-android-notification.png`
- `assets/favicon.png`

**Splash Screens:**
- `assets/splash/` directory (currently empty, needs to be populated)
- Update splash screen references in `app.config.js`

**Logo Assets:**
- `assets/logo.png`
- `assets/kawaii.png`
- `assets/kawaii_smol.png`

### 2. Configuration Files
Create/Update these configuration files:

**Google Services:**
- `google-services.json` (Android)
- iOS equivalent configuration file

**Environment Variables:**
- Copy `.env.example` to `.env` and update all values
- Update service URLs, API keys, and analytics IDs

### 3. Store Distribution Setup

**Google Play Store:**
1. Create new developer account if needed
2. Update `eas.json` with your App Store ID (currently shows Bluesky's ID: `6444370199`)
3. Configure signing keys

**Apple App Store:**
1. Create new App Store Connect account
2. Update bundle identifiers in Apple Developer Portal
3. Configure provisioning profiles and certificates

### 4. Service Infrastructure

**Backend Services:**
- Set up the API endpoints referenced in the configuration
- Configure analytics services (Sentry, Bitdrift, Growthbook)
- Set up geolocation and live events services

**Domain Setup:**
- Purchase and configure `yourapp.com` domain
- Set up SSL certificates
- Configure associated domains for deep linking

### 5. Legal and Compliance

**Privacy Policy:**
- Update privacy policy URLs
- Update privacy manifests in iOS configuration

**Terms of Service:**
- Create new terms of service
- Update any legal references in the app

## 🚀 Build and Deployment Instructions

### Prerequisites
```bash
# Install dependencies
yarn install

# Install Expo CLI
npm install -g @expo/cli

# Login to Expo
expo login
```

### Development Build
```bash
# Start development server
yarn start

# Run on iOS
yarn ios

# Run on Android
yarn android
```

### Production Build
```bash
# Build for all platforms
yarn build-all

# Build iOS only
yarn build-ios

# Build Android only
yarn build-android
```

### Store Submission
```bash
# Submit to App Stores (requires EAS configuration)
eas submit --platform ios
eas submit --platform android
```

## ⚠️ Important Notes

1. **DO NOT** submit to app stores with Bluesky's assets or identifiers
2. **REPLACE ALL** visual assets before distribution
3. **UPDATE ALL** service endpoints and API keys
4. **TEST** all functionality including deep linking and notifications
5. **VERIFY** all legal compliance requirements

## 📋 Final Checklist Before Store Submission

- [ ] All app icons replaced with custom designs
- [ ] All splash screens customized
- [ ] Bundle identifiers match your developer accounts
- [ ] API endpoints point to your infrastructure
- [ ] Analytics services configured with your accounts
- [ ] Privacy policy and terms of service created
- [ ] Deep linking domains configured
- [ ] Push notifications working
- [ ] All Bluesky branding removed from UI
- [ ] Build successfully runs on physical devices
- [ ] Store listing assets prepared
- [ ] Legal review completed

## 🔧 Customization Points

The following files may need additional customization based on your specific requirements:

- `src/lib/constants.ts` - Additional constants and URLs
- `src/locale/locales/en/messages.po` - UI text strings
- `eas.json` - Build configuration
- `app.config.js` - Additional app configuration
- Plugin files in `plugins/` directory - Platform-specific configurations

## 📞 Support

For issues related to:
- **Original Bluesky code**: Refer to Bluesky's documentation
- **Rebranding changes**: Review this document
- **Build issues**: Check Expo and React Native documentation
- **Store submission**: Follow platform-specific guidelines

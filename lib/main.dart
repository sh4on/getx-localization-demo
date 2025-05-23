import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importing GetX package for state management and localization

void main() {
  runApp(const MyApp()); // Entry point of the app
}

// Root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp instead of MaterialApp to enable GetX features
      translations: AppLocalizations(), // 1️⃣ Provides translations defined in AppLocalizations
      locale: Get.deviceLocale, // 2️⃣ Automatically detects and uses the device's locale
      fallbackLocale: const Locale('en', 'EN'), // 3️⃣ Fallback language if device locale is not supported
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Optional app theming
        useMaterial3: true, // Enables Material 3 design
      ),
      home: const MyHomePage(), // 4️⃣ The main screen shown on app launch
    );
  }
}

// Home screen of the app
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr), // 5️⃣ 'tr' is used to translate using the key 'app_name'
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centering the content vertically
          children: [

            // 6️⃣ Display translated app name
            Text('app_name'.tr),

            // 7️⃣ Display translated welcome message
            Text('welcome_text'.tr),

            const SizedBox(height: 20), // Add vertical space

            // 8️⃣ Button to change the app's locale to English
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('en', 'EN')); // Update the locale to English
              },
              child: const Text('English'),
            ),

            // 9️⃣ Button to change the app's locale to German
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('de', 'DE')); // Update the locale to German
              },
              child: const Text('Deutsch'),
            ),

            const SizedBox(height: 20), // Add vertical space

            // 10️⃣ Display translated settings text
            Text('settings_text'.tr),
          ],
        ),
      ),
    );
  }
}

// 11️⃣ This class holds all the translation keys and values
class AppLocalizations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    // English Translations
    'en_US': {
      'app_name': 'Test App', // Key: app_name -> Value: Test App
      'settings_text': 'Settings', // Key: settings_text -> Value: Settings
      'welcome_text': 'Hello, Welcome Aboard.', // Key: welcome_text -> Value: Hello, Welcome Aboard.
    },

    // German Translations
    'de_DE': {
      'app_name': 'Test App', // You can change this if app name should be translated
      'settings_text': 'Einstellungen', // German word for Settings
      'welcome_text': 'Hallo, Willkommen an Bord.', // German welcome message
    },
  };
}

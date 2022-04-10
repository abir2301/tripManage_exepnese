import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    // scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    // primaryColor: Colors.black,
    //colorScheme: ColorScheme.dark(),
    
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline2: TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold
      ),
      button: TextStyle(
          fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
    ),
    // scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    // primaryColor: Colors.black,
    //colorScheme: ColorScheme.dark(),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
       headline2: TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold
      ),
      button: TextStyle(

          fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
    // scaffoldBackgroundColor: Colors.white,
    // primaryColor: Colors.blue,
    // ////colorScheme: ColorScheme.light(background: Colors.blue),
    // iconTheme: const IconThemeData(color: Colors.blue, opacity: 0.8),
    // textTheme: const TextTheme(
    //     button: TextStyle(
    //         fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
    //     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold)),
  );
}

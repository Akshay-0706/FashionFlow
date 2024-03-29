import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool isDarkMode = true;
  String theme = "Auto";

  ThemeMode currentTheme() {
    return theme == "Auto"
        ? ThemeMode.system
        : theme == "Dark"
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  void changeThemeMode(String theme) {
    this.theme = theme;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: "OverPass",
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: CustomColors.background,
        iconTheme: IconThemeData(color: CustomColors.foreground),
      ),
      scaffoldBackgroundColor: CustomColors.background,
      backgroundColor: CustomColors.background,
      colorScheme:
          const ColorScheme.light().copyWith(secondary: CustomColors.primary),
      primaryColor: CustomColors.primary,
      primaryColorLight: CustomColors.foregroundAlt,
      primaryColorDark: CustomColors.foreground,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: "OverPass",
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: CustomColors.backgroundDark,
        iconTheme: IconThemeData(color: CustomColors.foregroundDark),
      ),
      scaffoldBackgroundColor: CustomColors.backgroundDark,
      backgroundColor: CustomColors.backgroundDark,
      colorScheme: const ColorScheme.dark()
          .copyWith(secondary: CustomColors.primaryDark),
      primaryColor: CustomColors.primaryDark,
      primaryColorLight: CustomColors.foregroundAltDark,
      primaryColorDark: CustomColors.foregroundDark,
    );
  }
}

class CustomColors {
  // Light mode colors
  static Color primary = const Color(0xFF006AF5);
  static Color foreground = const Color(0xff1C1C23);
  static Color foregroundAlt = Colors.black;
  static Color background = const Color(0xffFCF7F8);

  // Dark mode colors
  static Color primaryDark = Color(0xFF006AF5);
  static Color foregroundDark = const Color(0xffFCF7F8);
  static Color foregroundAltDark = const Color(0xffD2D2D2);
  static Color backgroundDark = const Color(0xff1C1C23);
}

class Pallete {
  final BuildContext context;

  Pallete(this.context);

  Color get primary => Theme.of(context).primaryColor;
  Color get primaryDark => Theme.of(context).primaryColorDark;
  Color get primaryLight => Theme.of(context).primaryColorLight;
  Color get background => Theme.of(context).backgroundColor;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_constants.dart';

class ThemeConfig {
  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        background: ColorConstants.darkScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryDarkAppColor,
        primaryText: Colors.white,
        secondaryText: Colors.black,
        accentColor: ColorConstants.secondaryDarkAppColor,
        divider: Colors.black45,
        buttonBackground: Colors.white,
        buttonText: ColorConstants.secondaryDarkAppColor,
        disabled: ColorConstants.secondaryDarkAppColor,
        error: Colors.red,
      );

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: ColorConstants.lightScaffoldBackgroundColor,
        cardBackground: ColorConstants.secondaryAppColor,
        primaryText: Colors.black,
        secondaryText: Colors.white,
        accentColor: ColorConstants.secondaryAppColor,
        divider: ColorConstants.secondaryAppColor,
        buttonBackground: const Color.fromRGBO(93, 176, 117, 1),
        buttonText: ColorConstants.secondaryAppColor,
        disabled: ColorConstants.secondaryAppColor,
        error: Colors.red,
      );

  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    required Color secondaryText,
    required Color accentColor,
    required Color divider,
    required Color buttonBackground,
    required Color buttonText,
    required Color cardBackground,
    required Color disabled,
    required Color error,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      brightness: brightness,
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.red))),
              padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(16)))),
      primaryColor: accentColor,
      appBarTheme: AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: brightness),
        color: cardBackground,
        iconTheme: IconThemeData(
          color: secondaryText,
        ),
        toolbarTextStyle: TextTheme(
          bodyLarge: baseTextTheme.bodyLarge?.copyWith(
            color: secondaryText,
            fontSize: 18,
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          bodyLarge: baseTextTheme.bodyLarge?.copyWith(
            color: secondaryText,
            fontSize: 18,
          ),
        ).titleLarge,
      ),
      iconTheme: IconThemeData(
        color: secondaryText,
        size: 16.0,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          primaryContainer: accentColor,
          secondary: accentColor,
          secondaryContainer: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontFamily: '',
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: primaryText.withOpacity(0.5),
        ),
        hintStyle: TextStyle(
          color: secondaryText,
          fontSize: 13.0,
          fontWeight: FontWeight.w300,
        ),
      ),
      fontFamily: '',
      textTheme: TextTheme(
        displayLarge: baseTextTheme.displayLarge?.copyWith(
          color: primaryText,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: baseTextTheme.displayMedium?.copyWith(
          color: primaryText,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: baseTextTheme.displaySmall?.copyWith(
          color: secondaryText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          color: primaryText,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: baseTextTheme.headlineSmall?.copyWith(
          color: primaryText,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: baseTextTheme.titleLarge?.copyWith(
          color: primaryText,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(
          color: secondaryText,
          fontSize: 15,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          color: primaryText,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: baseTextTheme.labelLarge?.copyWith(
          color: primaryText,
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: baseTextTheme.bodySmall?.copyWith(
          color: primaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w300,
        ),
        labelSmall: baseTextTheme.labelSmall?.copyWith(
          color: secondaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: baseTextTheme.titleMedium?.copyWith(
          color: primaryText,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: baseTextTheme.titleSmall?.copyWith(
          color: secondaryText,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
      ), checkboxTheme: CheckboxThemeData(
 fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
 if (states.contains(WidgetState.disabled)) { return null; }
 if (states.contains(WidgetState.selected)) { return accentColor; }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
 if (states.contains(WidgetState.disabled)) { return null; }
 if (states.contains(WidgetState.selected)) { return accentColor; }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
 if (states.contains(WidgetState.disabled)) { return null; }
 if (states.contains(WidgetState.selected)) { return accentColor; }
 return null;
 }),
 trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
 if (states.contains(WidgetState.disabled)) { return null; }
 if (states.contains(WidgetState.selected)) { return accentColor; }
 return null;
 }),
 ), colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: accentColor, brightness: brightness).copyWith(background: background).copyWith(error: error),
    );
  }
}

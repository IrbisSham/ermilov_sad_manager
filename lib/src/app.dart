
import 'package:ermilov_sad_manager/src/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme_data.dart';
import 'utils/app_state_notifier.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return MaterialApp(
        title: 'News!',
        theme: ThemeConfig.lightTheme,
        darkTheme: ThemeConfig.darkTheme,
        themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        onGenerateRoute: routes,
      );
    });
  }
}

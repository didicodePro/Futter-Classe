import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_colors.dart';
import 'theme/theme_provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Recettes CCNB',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: AppColors.lightPrimary,
            scaffoldBackgroundColor: AppColors.lightBackground,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.lightPrimary,
              titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black87),
              bodyMedium: TextStyle(color: Colors.black54),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: AppColors.darkPrimary,
            scaffoldBackgroundColor: AppColors.darkBackground,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.darkPrimary,
              titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.grey),
            ),
          ),
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light, // 🔥 Utilisation du provider
          home: const MainScreen(),
        );
      },
    );
  }
}

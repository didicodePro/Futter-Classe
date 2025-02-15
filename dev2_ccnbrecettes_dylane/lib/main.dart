import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'screens/recipe_screen.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: DevicePreview(
        // enabled: !kReleaseMode,
        builder: (context) => const MainApp(),
      )
    )
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.themeData,
      home: const RecipeScreen(),
    );
  }
}

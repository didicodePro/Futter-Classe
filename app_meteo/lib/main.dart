import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => AppMeteo()));
}

class AppMeteo extends StatelessWidget {
  const AppMeteo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "App Meteo",
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          darkTheme: ThemeData.dark(),
      home: AppMeteoAcceuil(title: "App Meteo"),
    );
  }
}

class AppMeteoAcceuil extends StatelessWidget {
  const AppMeteoAcceuil({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 1],
              colors: [
                Colors.blue,
                Colors.grey,
              ]
            )
          ),

          child: Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                
                Text("Bathurst", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),

                SizedBox(height: 8),

                Text("25°C", style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white)),

                SizedBox(height: 16),

                Text("Sunny", style: TextStyle(fontSize: 24, color:Colors.greenAccent)),

                SizedBox(height: 32),


                Icon(Icons.wb_sunny, size: 100, color: Colors.orange),

              ]
            ),
          ),
        )
      )
    );
  }
}

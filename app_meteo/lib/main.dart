import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
      DevicePreview(enabled: !kReleaseMode, builder: (context) => AppMeteo()));
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
  AppMeteoAcceuil({super.key, required this.title});

  final String title;

  final List<Map<String, dynamic>> prevision = [
    {'temps': 'Maintenant', 'icone': Icons.wb_sunny, 'temperature': '-6°'},
    {'temps': '13:00', 'icone': Icons.wb_cloudy, 'temperature': '-5°'},
    {'temps': '15:00', 'icone': Icons.wb_cloudy, 'temperature': '-4°'},
    {'temps': '17:00', 'icone': Icons.wb_sunny, 'temperature': '-3°'},
    {'temps': '19:00', 'icone': Icons.wb_sunny, 'temperature': '-3°'},
    {'temps': '21:00', 'icone': Icons.wb_sunny, 'temperature': '-3°'},
  ];

  final List<Map<String, dynamic>> prevDixJours = [
    {
      'journee': 'Aujourd’hui',
      'icone': Icons.wb_sunny,
      'tempMin': '-6°',
      'tempMax': '-3°'
    },
    {
      'journee': 'LUN',
      'icone': Icons.wb_cloudy,
      'tempMin': '-5°',
      'tempMax': '-3°'
    },
    {
      'journee': 'MER',
      'icone': Icons.wb_cloudy,
      'tempMin': '-5°',
      'tempMax': '-3°'
    },
    {
      'journee': 'JEU',
      'icone': Icons.wb_cloudy,
      'tempMin': '-5°',
      'tempMax': '-3°'
    },
    {
      'journee': 'VEN',
      'icone': Icons.wb_cloudy,
      'tempMin': '-5°',
      'tempMax': '-3°'
    },
    {
      'journee': 'SAM',
      'icone': Icons.wb_cloudy,
      'tempMin': '-5°',
      'tempMax': '-3°'
    },
    {
      'journee': 'DIM',
      'icone': Icons.wb_cloudy,
      'tempMin': '-5°',
      'tempMax': '-3°'
    },
    {
      'journee': 'LUN',
      'icone': Icons.wb_cloudy,
      'tempMin': '-5°',
      'tempMax': '-3°'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("../images/sky_pexels.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Nom de ville
                    Text(
                      'Bathurst',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ), // Text
                    SizedBox(height: 8), // Boîte d'espacement

                    Text(
                      '25°',
                      style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ), // symbol ° alt+0176 // Text

                    SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Temps ressentie : ',
                            style: TextStyle(
                                fontSize: 14,
                                color:
                                    Colors.white)), // symbol ° alt+0176 // Text

                        SizedBox(width: 10),

                        Text('12°',
                            style: TextStyle(
                                fontSize: 28,
                                color:
                                    Colors.white)), // symbol ° alt+0176 // Text
                      ],
                    ), // Row

                    SizedBox(height: 5),

                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 141, 184, 220),
                        borderRadius: BorderRadius.circular(16.0),
                      ), // BoxDecoration

                      padding: const EdgeInsets.all(15.0), // Padding interne
                      width: double.infinity, // plein largeur du parent
                      margin: EdgeInsets.all(10),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // alignement à droite
                        children: [
                          Text(
                            'Des conditions nuageuses sont prévues pour le reste de la journée. Les rafales de vent peuvent atteindre 15 km/h. ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ), // TextStyle
                          ),

                          Divider(
                            color: Colors.white,
                            thickness: 1.0, // épaisseur de la ligne
                            height: 20, // espace entre le contenu et la ligne
                          ), // Divider

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,

                            child: Row(
                              children: prevision.map((data) {
                                return Container(
                                  width: 65,
                                  margin: EdgeInsets.only(right: 8),

                                  child: RangeeMeteo(
                                    temps: data['temps'],
                                    icone: data['icone'],
                                    temperature: data['temperature'],
                                  ), // RangeMeteo
                                ); // Container
                              }).toList(),
                            ), // Row
                          ) // SingleChildScrollView
                        ], // Column children
                      ), // Column
                    ) // Container
                    ,
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 141, 184, 220),
                        borderRadius: BorderRadius.circular(16.0),
                      ), // BoxDecoration

                      padding: const EdgeInsets.all(15.0), // Padding interne
                      width: double.infinity, // Pleine largeur du parent
                      margin: EdgeInsets.all(10),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Alignement à gauche
                        children: [
                          Text(
                            '🌦 PRÉVISION SUR 10 JOURS',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors
                                  .white, // Couleur du texte pour la visibilité
                            ), // TextStyle
                          ), // Text

                          Divider(
                            color: Colors.white,
                            thickness: 1.0, // Épaisseur de la ligne
                            height: 20, // Espace entre le contenu et la ligne
                          ), // Divider

                          SizedBox(
                            height:
                                200, // Définit une hauteur fixe pour le défilement
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,

                              child: Column(
                                children: prevDixJours.map((data) {
                                  return Container(
                                    height: 50,

                                    child: ColonneMeteo(
                                      journee: data['journee'],
                                      icone: data['icone'],
                                      tempMin: data['tempMin'],
                                      tempMax: data['tempMax'],
                                    ), // ColonneMeteo
                                  ); // Container
                                }).toList(),
                              ), // Column
                            ), // SingleChildScrollView
                          ) // SizedBox
                        ], // Column children
                      ), // Column
                    ), // Container                 ,

                    SizedBox(height: 10),
                  ],
                ),
              ),
            )));
  }
}

class RangeeMeteo extends StatelessWidget {
  final String temps;
  final IconData icone;
  final String temperature;

  const RangeeMeteo({
    super.key,
    required this.temps,
    required this.icone,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          temps,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        ), // Text
        SizedBox(height: 8), // Boîte d'espacement

        Icon(
          icone,
          size: 30,
          color: Colors.white,
        ), // Icon
        SizedBox(height: 8), // Boîte d'espacement

        Text(
          temperature,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ), // Text
      ],
    ); // Column
  }
}

class ColonneMeteo extends StatelessWidget {
  final String journee;
  final IconData icone;
  final String tempMin;
  final String tempMax;

  const ColonneMeteo({
    super.key,
    required this.journee,
    required this.icone,
    required this.tempMin,
    required this.tempMax,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: Text(
            journee,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ), // Text
        ), // SizedBox

        Icon(
          icone,
          size: 40,
          color: Colors.white,
        ), // Icon

        SizedBox(width: 30),

        Text(
          tempMin,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ), // Text

        SizedBox(width: 30),

        Text(
          tempMax,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ), // Text
      ],
    ); // Row
  }
}

//http://localhost:64519/

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // Margin padding
          child: Column(children: [
            Container(
              // Color and Padding
              margin: EdgeInsets.all(20), 
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  Text("Hello PROG1296", style: TextStyle(color: Colors.white)),
            ),
            Container(
              // Color and Padding
              width: 200,
              height: 200,
              color: Colors.limeAccent,
              alignment: Alignment.center,
              child: Text("Hello PROG1296", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              
            )
          ]),
        ),
      ),
    );
  }
}

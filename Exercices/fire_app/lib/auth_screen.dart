import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String message = "";

  // 🔹 Inscription
  Future<void> signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() => message = "Inscription réussie !");
    } catch (e) {
      setState(() => message = "Erreur : ${e.toString()}");
    }
  }

  // 🔹 Connexion
  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() => message = "Connexion réussie !");
    } catch (e) {
      setState(() => message = "Erreur : ${e.toString()}");
    }
  }

  // 🔹 Déconnexion
  Future<void> signOut() async {
    await _auth.signOut();
    setState(() => message = "Déconnecté !");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Authentification Firebase")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Mot de passe"),
              obscureText: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: signUp, child: Text("S'inscrire")),
            ElevatedButton(onPressed: signIn, child: Text("Se connecter")),
            ElevatedButton(onPressed: signOut, child: Text("Se déconnecter")),
            SizedBox(height: 10),
            Text(message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

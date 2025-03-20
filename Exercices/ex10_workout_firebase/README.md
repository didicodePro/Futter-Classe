# ex10_workout_firebase

A new Flutter project.

Parfait ! On va commencer par **configurer Firebase avec Flutter**.  

---

## 🔥 1️⃣ Configuration de Firebase avec Flutter  

### 🛠️ **1. Installer Firebase CLI (si ce n'est pas déjà fait)**
Vérifie que Firebase CLI est installé :  

```sh
firebase --version
```

Si la commande ne fonctionne pas, installe Firebase CLI :  

```sh
npm install -g firebase-tools
```

Ensuite, connecte-toi à Firebase avec :  

```sh
firebase login
```

---

### 📌 **2. Créer un projet Firebase**
1. Va sur [Firebase Console](https://console.firebase.google.com/)  
2. Clique sur **"Ajouter un projet"**  
3. Donne un nom à ton projet et termine la configuration  

---

### 📲 **3. Configurer Firebase avec Flutter**
Dans ton projet Flutter, exécute :  

```sh
dart pub global activate flutterfire_cli
```

Ensuite, exécute :  

```sh
flutterfire configure
```

🔹 **Choisis ton projet Firebase**  
🔹 **Sélectionne Android et iOS si tu veux les deux**  
🔹 **Génération automatique du fichier `firebase_options.dart`**  

---

Une fois cette étape terminée, on pourra passer à **l'authentification avec Firebase Auth**. Dis-moi si tout fonctionne jusqu'ici ! 🚀


dart pub global activate flutterfire_cli
flutterfire configure
flutter pub add firebase_core
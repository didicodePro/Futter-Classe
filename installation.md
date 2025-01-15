### **Où placer le dossier Flutter SDK ?**
1. **Emplacement recommandé :**
   Placez le dossier Flutter SDK directement dans un répertoire à la racine de votre disque principal (généralement `C:\`). Par exemple :
   ```
   C:\flutter
   ```
   Cela permet d’éviter des chemins trop longs ou des conflits liés à des permissions.

2. **Pourquoi éviter certains emplacements ?**
   - **Dossiers utilisateurs (comme Documents ou Desktop)** :
     Ces dossiers peuvent être gérés par des politiques d’entreprise ou protégés par des fonctionnalités comme OneDrive, ce qui peut poser problème pour Flutter.
   - **Dossiers avec des espaces ou caractères spéciaux** :
     Par exemple, `C:\Program Files\flutter` n’est pas idéal, car les espaces dans le chemin peuvent causer des soucis avec certains outils ou scripts.
   - **Profondeur excessive** :
     Les outils de Flutter peuvent générer des chemins très longs, ce qui dépasse parfois les limites de Windows (260 caractères). Garder le chemin court minimise ce risque.

---

### **Après l'installation du SDK Flutter :**
1. **Ajoutez le SDK à votre variable PATH** :
   - Accédez aux **Paramètres système avancés** → **Variables d’environnement**.
   - Ajoutez le chemin suivant à la variable `Path` :
     ```
     C:\flutter\bin
     ```
   - Cela permet de lancer les commandes Flutter (`flutter doctor`, etc.) depuis n’importe quel terminal.

2. **Validez l’installation :**
   - Ouvrez un terminal (PowerShell ou Command Prompt).
   - Exécutez :
     ```bash
     flutter doctor
     ```
   - Suivez les recommandations affichées pour terminer la configuration (ex. installation d’Android Studio, configuration des émulateurs, etc.).

---

### **Récapitulatif :**
- **Placer le dossier** : `C:\flutter`
- **Éviter** : Les espaces, les chemins profonds, les dossiers protégés.
- **Configurer** : Ajouter `C:\flutter\bin` au `PATH`.

Dis-moi si tu veux de l’aide pour la suite, comme la configuration d’Android Studio ou des émulateurs ! 😊

installer 
flutter 
extraire dans c:\
modifier le path des variables d'environnement

android studio
tools -> SDK manager -> SDK Tools -> android SDK Command-line

Accepter les licences d'utilisation
flutter doctor --android-licenses

verifier
flutter doctor

creer un mobile virtuel
Allez dans Android Studio > Tools > Android > AVD Manager puis cliquez sur Create Virtual Device.
Choisissez par exemple Pixel 6 image systeme = tiramisu puis faites Next.

Installez ensuite une version d'Android puis faites Next.
Cliquez enfin sur Finish.

Flutter run key commands.
r Hot reload. 
R Hot restart.
h List all available interactive commands.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).

### ***Pourquoi votre VM Android Studio se met à jour avec VS Code?***
Lorsque vous exécutez flutter run dans le terminal de VS Code, Flutter détecte tous les appareils connectés, qu'ils soient physiques ou virtuels (comme votre VM Android Studio). Une fois que l’appareil est détecté, Flutter communique directement avec lui via l’outil adb (Android Debug Bridge).

Voici les étapes principales :

Détection de l'émulateur Android :

Quand vous démarrez votre VM Android dans Android Studio, elle devient visible pour l’outil adb.
Flutter utilise adb pour détecter tous les appareils disponibles (émulateurs ou appareils physiques).
Lorsque vous exécutez flutter run, Flutter envoie votre application à l’appareil détecté via adb.
Communication indépendante d'Android Studio :

Bien que vous utilisiez Android Studio pour démarrer votre VM, Flutter ne dépend pas d'Android Studio une fois l'émulateur en marche.
Flutter communique directement avec l'émulateur via le ADB server, sans passer par Android Studio.
Mise à jour en temps réel :

Flutter utilise le debug mode pour exécuter l'application. Cela inclut des fonctionnalités comme Hot Reload et Hot Restart qui envoient les mises à jour de votre code à l’appareil connecté.
Ces fonctionnalités fonctionnent indépendamment de l’environnement dans lequel le code est écrit (VS Code, Android Studio, etc.).

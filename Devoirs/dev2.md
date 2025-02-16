Ce code Flutter crée une application qui permet d’enregistrer et de suivre les statistiques d’un gardien de but. Voici les parties les plus importantes :

------

## **1. `main()` et `runApp()`**

### 📌 **Lancement de l'application**

```dart
void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MainApp()));
}
```

✅ **`DevicePreview`** : Permet de tester l’interface sur différentes tailles d’écran.
 ✅ **`MainApp()`** : Classe principale qui affiche l’interface utilisateur.

------

## **2. `Match` (Modèle de données)**

### 📌 **Représentation d’un match**

```dart
class Match {
  final String goalieName;
  final String homeTeam;
  final String awayTeam;
  final DateTime dateTime;
  final int shotsAgainst;
  final int goalsAgainst;

  Match({
    required this.goalieName,
    required this.homeTeam,
    required this.awayTeam,
    required this.dateTime,
    required this.shotsAgainst,
    required this.goalsAgainst,
  });

  double get savePercentage {
    if (shotsAgainst == 0) return 0;
    return ((shotsAgainst - goalsAgainst) / shotsAgainst) * 100;
  }
}
```

📌 **But de la classe `Match`**
 Elle stocke les informations d'un match et calcule le pourcentage d’arrêts du gardien.

✅ **`savePercentage`** : Calcul du pourcentage d’arrêts du gardien.

> (Lancersrec\cus−Butscontre)/Lancersrec\cus(Lancers reçus - Buts contre) / Lancers reçus * 100

------

## **3. `MainApp` (Application principale)**

### 📌 **Configuration de l'application**

```dart
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Stats de Gardien de buts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const GoalkeeperStatsPage(),
    );
  }
}
```

✅ **Désactive la bannière DEBUG**
 ✅ **Définit un thème clair avec du bleu**
 ✅ **Affiche `GoalkeeperStatsPage` comme écran principal**

------

## **4. `GoalkeeperStatsPage` (Écran principal)**

### 📌 **Déclaration des variables**

```dart
final TextEditingController _nameController = TextEditingController();
final List<Match> listeMatchs = [];
String? selectedTeam;
String? opposingTeam;
int shotsAgainst = 0;
int goalsAgainst = 0;
DateTime selectedDate = DateTime(2025, 2, 12);
TimeOfDay selectedTime = const TimeOfDay(hour: 21, minute: 5);
```

✅ Stocke le **nom du gardien**, les **équipes**, les **statistiques du match**, la **date** et l’**heure**.

------

## **5. `_showStats()` (Affichage des statistiques)**

### 📌 **Affiche une boîte de dialogue avec les stats**

```dart
void _showStats() {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Les STATS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Lancés reçu: $shotsAgainst'),
            Text('Buts contre: $goalsAgainst'),
            Text('Pourcentage d\'arrêt: ${_calculateSavePercentage().toStringAsFixed(2)}%'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        ),
      ),
    ),
  );
}
```

✅ **Affiche les stats du gardien**
 ✅ **Bouton pour fermer la boîte de dialogue**

------

## **6. `_showMatchHistory()` (Affichage de l’historique des matchs)**

### 📌 **Affiche les anciens matchs dans un `BottomSheet`**

```dart
void _showMatchHistory() {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Historique des matchs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...listeMatchs.map((match) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${match.dateTime.toString().substring(0, 10)} - ${match.homeTeam} vs ${match.awayTeam}',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            'Gardien: ${match.goalieName} | % Arrêts: ${match.savePercentage.toStringAsFixed(2)}%',
                          ),
                        ],
                      ),
                    );
                  }),
                  if (listeMatchs.isEmpty)
                    const Text('Aucun match enregistré'),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
```

✅ **Affiche l’historique des matchs enregistrés**
 ✅ **Utilise `SingleChildScrollView` pour scroller si besoin**

------

## **7. `_calculateSavePercentage()`**

### 📌 **Méthode qui calcule le % d’arrêts**

```dart
double _calculateSavePercentage() {
  if (shotsAgainst == 0) return 0;
  return ((shotsAgainst - goalsAgainst) / shotsAgainst) * 100;
}
```

✅ **Même formule que dans `Match`**
 ✅ **Évite la division par zéro**

------

## **8. Interface utilisateur (`build()`)**

### 📌 **Affiche les champs pour entrer les stats**

- **Nom du gardien**
- **Équipe locale**
- **Date et heure du match**
- **Équipe visiteuse**
- **Boutons pour ajuster les stats**
- **Affichage du pourcentage d’arrêts**
- **Bouton pour sauvegarder le match**
- **Bouton de réinitialisation**

```dart
TextField(
  controller: _nameController,
  decoration: const InputDecoration(
    labelText: 'Nom du gardien de but',
    border: UnderlineInputBorder(),
  ),
),
DropdownButtonFormField<String>(
  value: selectedTeam,
  decoration: const InputDecoration(
    labelText: 'Equipe',
    border: UnderlineInputBorder(),
  ),
  items: ['Equipe A', 'Equipe B', 'Equipe C', 'Equipe D']
      .map((team) => DropdownMenuItem(value: team, child: Text(team)))
      .toList(),
  onChanged: (value) => setState(() => selectedTeam = value),
),
```

✅ **Permet de saisir les données du match**
 ✅ **Stocke ces valeurs dans les variables de l’état (`State`)**

------

## **9. Bouton de sauvegarde du match**

```dart
ElevatedButton(
  onPressed: () {
    if (_nameController.text.isNotEmpty && selectedTeam != null && opposingTeam != null) {
      final match = Match(
        goalieName: _nameController.text,
        homeTeam: selectedTeam!,
        awayTeam: opposingTeam!,
        dateTime: DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        ),
        shotsAgainst: shotsAgainst,
        goalsAgainst: goalsAgainst,
      );
      setState(() => listeMatchs.add(match));
      _showMatchHistory();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }
  },
),
```

✅ **Vérifie que tous les champs sont remplis**
 ✅ **Ajoute un match dans `listeMatchs`**
 ✅ **Affiche l’historique des matchs**

------

### **Résumé**

🚀 Cette application permet :
 ✅ De saisir des stats de gardien
 ✅ De calculer le % d’arrêts
 ✅ D’afficher l’historique des matchs
 ✅ De sauvegarder et afficher les données

As-tu des questions sur une partie spécifique ? 😊
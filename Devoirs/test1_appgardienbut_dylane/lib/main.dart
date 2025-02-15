import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MainApp()));
}

class AppColors {
  static const Color lightPrimary = Color(0xFF5D5DA8);
  static const Color lightSecondary = Color(0xFF8665B1);
  static const Color lightBackground = Color(0xFFF8F8F8);
  static const Color lightTextPrimary = Colors.black87;
  static const Color lightTextSecondary = Colors.grey;
}

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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Stats de Gardien de buts',
      theme: ThemeData(
        primaryColor: AppColors.lightPrimary,
        scaffoldBackgroundColor: AppColors.lightBackground,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightPrimary,
            foregroundColor: Colors.white,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.lightTextSecondary),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightPrimary),
          ),
        ),
      ),
      home: const GoalkeeperStatsPage(),
    );
  }
}

class GoalkeeperStatsPage extends StatefulWidget {
  const GoalkeeperStatsPage({super.key});

  @override
  State<GoalkeeperStatsPage> createState() => _GoalkeeperStatsPageState();
}

class _GoalkeeperStatsPageState extends State<GoalkeeperStatsPage> {
  final TextEditingController _nameController = TextEditingController();
  final List<Match> listeMatchs = [];
  String? selectedTeam;
  String? opposingTeam;
  int shotsAgainst = 0;
  int goalsAgainst = 0;
  DateTime selectedDate = DateTime(2025, 2, 12);
  TimeOfDay selectedTime = const TimeOfDay(hour: 21, minute: 5);

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
              const Text(
                'Les STATS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text('Lancés reçu: $shotsAgainst'),
              Text('Buts contre: $goalsAgainst'),
              Text('Pourcentage d\'arrêt: ${_calculateSavePercentage().toStringAsFixed(2)}%'),
              Text('Date: ${selectedDate.toString().substring(0, 10)}'),
              Text('Heure: ${selectedTime.format(context)}'),
              Text('Equipe local: $selectedTeam'),
              Text('Equipe visiteur: $opposingTeam'),
              Text('Nom du gardien: ${_nameController.text}'),
              const SizedBox(height: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Historique des matchs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
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
                          Text(
                            '${match.dateTime.toString().substring(0, 10)} - ${match.homeTeam} vs ${match.awayTeam}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Gardien de but: ${match.goalieName} | Arrêts: ${match.shotsAgainst - match.goalsAgainst} | '
                            'Buts contre: ${match.goalsAgainst} | % Arrêts: ${match.savePercentage.toStringAsFixed(2)}%',
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
  double _calculateSavePercentage() {
    if (shotsAgainst == 0) return 0;
    return ((shotsAgainst - goalsAgainst) / shotsAgainst) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Stats de Gardien de buts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.bar_chart),
                    onPressed: _showStats,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nom du gardien de but',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 209, 182, 243),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Date du match: ${selectedDate.toString().substring(0, 10)}',
                      style: TextStyle(color: AppColors.lightPrimary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Temps du match: ${selectedTime.format(context)}',
                      style: TextStyle(color: AppColors.lightPrimary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: opposingTeam,
                decoration: const InputDecoration(
                  labelText: 'Equipe visiteur',
                  border: UnderlineInputBorder(),
                ),
                items: ['Equipe A', 'Equipe B', 'Equipe C', 'Equipe D']
                    .map((team) => DropdownMenuItem(value: team, child: Text(team)))
                    .toList(),
                onChanged: (value) => setState(() => opposingTeam = value),
              ),
              const SizedBox(height: 24),
              const Text(
                'Lancer contre',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightSecondary,
                    radius: 15,
                    child: IconButton(
                      icon: const Icon(Icons.remove, size: 16, color: Colors.white),
                      onPressed: () {
                        if (shotsAgainst > 0) {
                          setState(() => shotsAgainst--);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '$shotsAgainst',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.lightPrimary,
                    radius: 15,
                    child: IconButton(
                      icon: const Icon(Icons.add, size: 16, color: Colors.white),
                      onPressed: () => setState(() => shotsAgainst++),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Buts contre',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.lightSecondary,
                    radius: 15,
                    child: IconButton(
                      icon: const Icon(Icons.remove, size: 16, color: Colors.white),
                      onPressed: () {
                        if (goalsAgainst > 0) {
                          setState(() => goalsAgainst--);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '$goalsAgainst',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.lightPrimary,
                    radius: 15,
                    child: IconButton(
                      icon: const Icon(Icons.add, size: 16, color: Colors.white),
                      onPressed: () => setState(() => goalsAgainst++),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Pourcentage d\'arrêt: ${_calculateSavePercentage().toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.lightTextPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Sauvegarder la partie'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _nameController.clear();
          selectedTeam = null;
          opposingTeam = null;
          shotsAgainst = 0;
          goalsAgainst = 0;
        }),
        backgroundColor: AppColors.lightPrimary,
        child: const Icon(Icons.refresh, color: Colors.white,),
      ),
    );
  }
}
// FICHIER MAIN.DART

import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'app_colors.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const GestionBudget(),
  ));
}

// Première classe appelée qui structure l'application
class GestionBudget extends StatelessWidget {
  const GestionBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.backgroundApp,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.backgroundApp,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.buttonBackground,
          foregroundColor: AppColors.buttonTextColor,
        ),
      ),
      home: GestionBudgetHome(),
    );
  }
}

final GlobalKey<GestionBudgetHomeState> homeScreenKey = GlobalKey();

class GestionBudgetHome extends StatefulWidget {
  GestionBudgetHome({Key? key}) : super(key: homeScreenKey);

  @override
  GestionBudgetHomeState createState() => GestionBudgetHomeState();
}

class GestionBudgetHomeState extends State<GestionBudgetHome> {
  final List<Map<String, dynamic>> _depenses = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _titreDepense = "";
  double _montantDepense = 0.0;
  final String _categorieDepense = "Essence";
  final DateTime _choisirDate = DateTime.now();

  double get _depensesTotales =>
      _depenses.fold(0.0, (sum, item) => sum + (item['montantDepense'] ?? 0.0));

  void _ajouterDepenses() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _depenses.add({
          'id': DateTime.now().millisecondsSinceEpoch,
          'titreDepense': _titreDepense,
          'montantDepense': _montantDepense,
          'categorieDepense': _categorieDepense,
          'date': _choisirDate,
        });
      });

      Navigator.of(context).pop();
    }
  }

  void supprimerDepense(int index) {
    setState(() {
      _depenses.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Dépense supprimée"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAjoutDepenseDialogue() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundLight,
          title: Text(
            'Ajouter nouvelle dépense',
            style: TextStyle(color: AppColors.textColor),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Titre de la dépense',
                    labelStyle: TextStyle(color: AppColors.textColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textColor),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Entrer un titre.';
                    }
                    return null;
                  },
                  onSaved: (value) => _titreDepense = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Montant',
                    labelStyle: TextStyle(color: AppColors.textColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple[400]!),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || double.tryParse(value) == null) {
                      return 'Veuillez entrer un montant valide.';
                    }
                    return null;
                  },
                  onSaved: (value) => _montantDepense = double.parse(value!),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _ajouterDepenses,
                  child: Text("Ajouter"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestion Budget"), actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _showAjoutDepenseDialogue,
        )
      ]),
      body: Column(
        children: [
          Expanded(
            child: _depenses.isEmpty
                ? Center(
                    child: Text(
                      'Aucune dépense enregistrée.',
                      style: TextStyle(fontSize: 18, color: Colors.purple[700]),
                    ),
                  )
                : ListView.builder(
                    itemCount: _depenses.length,
                    itemBuilder: (ctx, index) {
                      final depenseObj = _depenses[index];
                      return Dismissible(
                        key: ValueKey(depenseObj['id'] ?? index),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) => supprimerDepense(index),
                        background: Container(
                          color: AppColors.errorColor,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListTile(
                          title: Text(
                            depenseObj['titreDepense'],
                            style: TextStyle(color: AppColors.primary),
                          ),
                          subtitle: Text(
                            "${depenseObj['categorieDepense']} - ${depenseObj['date'].toLocal().toString().split(' ')[0]}",
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          trailing: Text(
                            "${depenseObj['montantDepense']} €",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              border: Border(
                  top: BorderSide(width: 2.0, color: AppColors.secondary)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Total des dépenses: ',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor)),
                    Text('$_depensesTotales',
                        style: TextStyle(
                            fontSize: 18, color: AppColors.textColor)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

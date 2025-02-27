import 'package:flutter/material.dart';

class Match {
  final String goalieName;
  final String homeTeam;
  final String awayTeam;
  final DateTime dateTime;
  final int shotsAgainst;
  final int goalsAgainst;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  Match({
    required this.goalieName,
    required this.homeTeam,
    required this.awayTeam,
    required this.dateTime,
    required this.shotsAgainst,
    required this.goalsAgainst,
    this.selectedDate,
    this.selectedTime,
  });

  double get savePercentage {
    if (shotsAgainst == 0) return 0;
    return ((shotsAgainst - goalsAgainst) / shotsAgainst) * 100;
  }
}

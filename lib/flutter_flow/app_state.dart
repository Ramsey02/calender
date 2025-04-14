import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  // App state variables
  DateTime? _selectedDay = DateTime.now();
  int _hourHeight = 60;

  // Getters
  DateTime? get selectedDay => _selectedDay;
  int get hourHeight => _hourHeight;

  // Setters
  void update() {
    notifyListeners();
  }

  set selectedDay(DateTime? value) {
    _selectedDay = value;
    notifyListeners();
  }

  set hourHeight(int value) {
    _hourHeight = value;
    notifyListeners();
  }
}
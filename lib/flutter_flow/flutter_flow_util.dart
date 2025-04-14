import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// General utility exports
export 'dart:convert' show jsonEncode, jsonDecode;
export 'dart:math' show Random;
export 'package:intl/intl.dart';

/// A utility function to safely set state if a widget is still mounted.
/// This will help prevent "setState() called after dispose()" errors.
void safeSetState(State state, VoidCallback fn) {
  if (state.mounted) {
    state.setState(fn);
  }
}

/// Returns either the value or a default if value is null or empty string
T valueOrDefault<T>(T? value, T defaultValue) =>
    (value is String && value.isEmpty) || value == null ? defaultValue : value;

/// Formats a DateTime object according to the provided format string
String dateTimeFormat(String format, DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  return DateFormat(format).format(dateTime);
}

/// Gets the current timestamp as a DateTime object
DateTime get getCurrentTimestamp => DateTime.now();

/// A convenience method to read a value by type from an object or map dynamically
dynamic getMapValue(dynamic source, String key) {
  if (source == null) {
    return null;
  }
  if (source is Map) {
    return source[key];
  }
  // For other object types, try to access the property by name
  // This is a simplified approach - in a real app you might use reflection
  return null;
}

/// Adds comparison operators to DateTime objects
extension DateTimeComparisonOperators on DateTime {
  bool operator <(DateTime other) => isBefore(other);
  bool operator >(DateTime other) => isAfter(other);
  bool operator <=(DateTime other) => this < other || isAtSameMomentAs(other);
  bool operator >=(DateTime other) => this > other || isAtSameMomentAs(other);
}

/// Helper extension for responsive sizing
extension MediaQueryExtension on BuildContext {
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;
  
  // A shorthand method to get screen dimensions
  Size get sizeOf => MediaQuery.of(this).size;
  
  // A shorthand method to get padding dimensions
  EdgeInsets get viewInsetsOf => MediaQuery.of(this).viewInsets;
}

/// This allows us to use context.watch<T>() for provider in older versions
extension ProviderExtension on BuildContext {
  T watch<T>() {
    return Provider.of<T>(this, listen: true);
  }
}

/// Import this class to use the Provider extension
class Provider {
  static T of<T>(BuildContext context, {bool listen = false}) {
    // This is a placeholder - in real code this would be implemented
    // to work with your actual state management solution
    throw UnimplementedError(
        'Provider.of() is not implemented. Add proper implementation based on your state management library.');
  }
}

/// Proxy class for FFAppState to avoid direct imports in multiple files
class FFAppState {
  // This would normally be a singleton or accessed through Provider
  // Add properties and methods as needed
  DateTime? _selectedDay = DateTime.now();
  int _hourHeight = 60;

  // Getters
  DateTime? get selectedDay => _selectedDay;
  int get hourHeight => _hourHeight;

  // Setters
  set selectedDay(DateTime? value) {
    _selectedDay = value;
    // Notify listeners in a real implementation
  }

  set hourHeight(int value) {
    _hourHeight = value;
    // Notify listeners in a real implementation
  }

  void update() {
    // Notify listeners in a real implementation
  }
}
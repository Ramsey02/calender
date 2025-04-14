import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export 'dart:convert' show jsonEncode, jsonDecode;
export 'dart:math' show Random;

export 'package:intl/intl.dart';

T valueOrDefault<T>(T? value, T defaultValue) =>
    (value is String && value.isEmpty) || value == null ? defaultValue : value;

String dateTimeFormat(String format, DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  return DateFormat(format).format(dateTime);
}

DateTime get getCurrentTimestamp => DateTime.now();

extension DateTimeComparisonOperators on DateTime {
  bool operator <(DateTime other) => isBefore(other);
  bool operator >(DateTime other) => isAfter(other);
  bool operator <=(DateTime other) => this < other || isAtSameMomentAs(other);
  bool operator >=(DateTime other) => this > other || isAtSameMomentAs(other);
}
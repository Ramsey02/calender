import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'flutter_flow/app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MaterialApp(
        title: 'SmartSchedule',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SmartSchedule'),
      ),
      body: Center(
        child: Text('Ready to start building your calendar!'),
      ),
    );
  }
}
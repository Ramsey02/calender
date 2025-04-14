import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'flutter_flow/app_state.dart';
import 'home_page_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: HomePageWidget(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
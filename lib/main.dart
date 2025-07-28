import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/login_provider.dart';
import 'pages/main_page.dart';


void main() {
  runApp(KonsultanKonstruksiApp());
}

class KonsultanKonstruksiApp extends StatelessWidget {
  const KonsultanKonstruksiApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konsultan Konstruksi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

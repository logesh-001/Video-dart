// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video/pages/vide_player_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Video Page",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: VideoPlayerPage(),
    );
  }
}

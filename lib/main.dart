import 'package:flutter/material.dart';
import 'package:movie_info_app/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

/*
https://movies-api.nomadcoders.workers.dev/popular
https://movies-api.nomadcoders.workers.dev/now-playing
https://movies-api.nomadcoders.workers.dev/coming-soon
https://movies-api.nomadcoders.workers.dev/movie?id=1 
*/

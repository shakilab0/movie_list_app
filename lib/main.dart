import 'package:flutter/material.dart';
import 'package:movie_list/pages/home_page.dart';
import 'package:movie_list/pages/movie_details_page.dart';
import 'package:movie_list/provider/movie_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        MovieDetailsPage.routeName: (context) => const MovieDetailsPage(),
      },
    );
  }
}


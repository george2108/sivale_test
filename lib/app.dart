import 'package:flutter/material.dart';

import 'src/presentation/pages/detail/detail_page.dart';
import 'src/presentation/pages/home/home_page.dart';
import 'src/utils/constants/routes_constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sivale Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: homeRoute,
      routes: {
        homeRoute: (_) => HomePage(),
        optionsRoute: (_) => const DetailPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:luminouskey_task/utils/providers.dart';
import 'package:luminouskey_task/views/landing_views/landing_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        title: 'Luminouskey Task',
        debugShowCheckedModeBanner: false, // Righteous
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // fontFamily:
        ),
        home: const LandingPage(),
      ),
    );
  }
}

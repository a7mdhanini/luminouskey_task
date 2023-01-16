import 'package:flutter/material.dart';
import 'package:luminouskey_task/utils/providers.dart';
import 'package:luminouskey_task/utils/shared_prefs.dart';
import 'package:luminouskey_task/views/home_views/home_page.dart';
import 'package:luminouskey_task/views/landing_views/landing_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  Future<bool> getUser() async {
    isLogin = PrefsDb.shPref!.getBool(PrefsDb.isLogin)!;
    return isLogin;
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: MaterialApp(
        title: 'Luminouskey Task',
        debugShowCheckedModeBanner: false, // Righteous
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLogin ? const HomePage() : const LandingPage(),
      ),
    );
  }
}

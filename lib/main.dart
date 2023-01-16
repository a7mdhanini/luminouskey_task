import 'package:flutter/material.dart';
import 'package:luminouskey_task/start/my_app.dart';
import 'package:luminouskey_task/utils/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsDb.shPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

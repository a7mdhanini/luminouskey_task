import 'package:luminouskey_task/controllers/login_provider.dart';
import 'package:luminouskey_task/controllers/signup_provider.dart';
import 'package:luminouskey_task/controllers/home_provider.dart';
import 'package:luminouskey_task/controllers/maps_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => HomePageProvider()),
    ChangeNotifierProvider(create: (_) => MapsProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => SignUpProvider()),
  ];
}

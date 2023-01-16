import 'package:flutter/material.dart';
import 'package:luminouskey_task/database/db_helper.dart';
import 'package:luminouskey_task/models/user_model.dart';
import 'package:luminouskey_task/shared/my_messenger.dart';
import 'package:luminouskey_task/utils/shared_prefs.dart';
import 'package:luminouskey_task/views/auth_views/login_page.dart';
import 'package:luminouskey_task/views/home_views/home_page.dart';

class LoginProvider extends ChangeNotifier {
  bool isObscure = false;

  void setIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  UserModel userModel = UserModel(
    userId: '',
    userEmail: '',
    userName: '',
    userPassword: '',
    userPhoneNumber: '',
  );

  void setUserEmail(String newVal) {
    userModel.userEmail = newVal;
    notifyListeners();
  }

  void setUserPassword(String newVal) {
    userModel.userPassword = newVal;
    notifyListeners();
  }

  DbHelper dbHelper = DbHelper();

  void loginUser(BuildContext context) {
    dbHelper
        .loginUser(context, userModel.userEmail, userModel.userPassword)
        .then((user) {
      if (user.userName.isNotEmpty) {
        PrefsDb.shPref!.setBool(PrefsDb.isLogin, true);
        Route route = MaterialPageRoute(builder: (_) => const HomePage());
        Navigator.pushReplacement(context, route);
      } else {
        myMessenger(context, 'Please Check your Email and Password');
      }
    });
  }

  void logOut(BuildContext context) {
    PrefsDb.shPref!.setBool(PrefsDb.isLogin, false);
    Route route = MaterialPageRoute(builder: (_) => const LoginPage());
    Navigator.pushReplacement(context, route);
  }
}

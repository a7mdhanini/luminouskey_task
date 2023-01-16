import 'package:flutter/material.dart';
import 'package:luminouskey_task/database/db_helper.dart';
import 'package:luminouskey_task/models/user_model.dart';
import 'package:luminouskey_task/shared/my_messenger.dart';
import 'package:luminouskey_task/views/auth_views/login_page.dart';

class SignUpProvider extends ChangeNotifier {
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

  void setUserName(String newVal) {
    userModel.userName = newVal;
    notifyListeners();
  }

  void setUserEmail(String newVal) {
    userModel.userEmail = newVal;
    notifyListeners();
  }

  void setUserPassword(String newVal) {
    userModel.userPassword = newVal;
    notifyListeners();
  }

  void setUserPhoneNumber(String newVal) {
    userModel.userPhoneNumber = newVal;
    notifyListeners();
  }

  DbHelper dbHelper = DbHelper();

  void createAccount(BuildContext context) {
    if (userModel.userName.isEmpty) {
      myMessenger(context, 'Please Enter your name');
    } else if (userModel.userEmail.isEmpty) {
      myMessenger(context, 'Please Enter your Email');
    } else if (userModel.userPhoneNumber.isEmpty) {
      myMessenger(context, 'Please Enter your Phone Number');
    } else if (userModel.userPassword.isEmpty) {
      myMessenger(context, 'Please Enter your Password');
    } else {
      myMessenger(context, 'Account Created');
      userModel.userId = DateTime.now().microsecond.toString();
      dbHelper.saveData(userModel).then((value) {
        Route route = MaterialPageRoute(builder: (_) => const LoginPage());
        Navigator.pushReplacement(context, route);
      });
    }
  }
}

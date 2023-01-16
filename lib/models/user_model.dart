import 'package:luminouskey_task/utils/helpers.dart';

class UserModel {
  String userId;
  String userEmail;
  String userName;
  String userPassword;
  String userPhoneNumber;

  UserModel({
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.userPassword,
    required this.userPhoneNumber,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: testMap(map, 'user_id', ''),
      userEmail: testMap(map, 'user_email', ''),
      userName: testMap(map, 'user_name', ''),
      userPassword: testMap(map, 'user_password', ''),
      userPhoneNumber: testMap(map, 'user_phone_number', ''),
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': userId,
      'user_name': userName,
      'user_email': userEmail,
      'user_password': userPassword,
      'user_phone_number': userPhoneNumber,
    };
    return map;
  }
}

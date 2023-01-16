import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:luminouskey_task/models/address_model.dart';
import 'package:luminouskey_task/models/doctor_model.dart';
import 'package:luminouskey_task/shared/my_messenger.dart';

class HomePageProvider extends ChangeNotifier {
  String username = 'FlutterDev@LuminousKey.com';
  String password = 'Flutter2023';

  ///----------------------------///
  ///------Loading on Save-------///
  ///----------------------------///
  bool isLoading = false;
  void setIsLoading(bool newVal) {
    isLoading = newVal;
    notifyListeners();
  }

  ///--------------------------///
  ///----fetch items Method----///
  ///--------------------------///
  List<DoctorModel> doctorsModelList = [];

  Future fetchDoctorsData(BuildContext context) async {
    doctorsModelList.clear();

    String credentials = "$username:$password";

    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);

    String url = 'https://flutter.linked4med.com/api/Doctors/GetDoctorsInfo';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $encoded',
        },
      );
      final extractData = json.decode(response.body);

      extractData.forEach(
        (key) {
          doctorsModelList.add(
            ///----Doctor Model----///
            DoctorModel(
              id: key['id'],
              doctorName: key['doctorName'],
              doctorEmail: key['doctorEmail'],
              phoneNumber: key['phoneNumber'],
              doctorImageURL: key['doctorImageURL'],

              ///----Address Model----///
              addressModel: AddressModel.fromMap(key['address']),
            ),
          );
        },
      );

      for (DoctorModel doctorsInfo in doctorsModelList) {
        log(doctorsInfo.doctorName);
        log(doctorsInfo.addressModel.city);
      }
    } catch (e) {
      log(e.toString());
      myMessenger(context, e.toString());
    }
  }
}

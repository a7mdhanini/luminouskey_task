import 'package:luminouskey_task/models/address_model.dart';
import 'package:luminouskey_task/utils/testers.dart';

class DoctorModel {
  int id;
  String doctorName;
  String doctorEmail;
  String phoneNumber;
  String doctorImageURL;
  AddressModel addressModel;

  DoctorModel({
    required this.id,
    required this.doctorName,
    required this.doctorEmail,
    required this.phoneNumber,
    required this.doctorImageURL,
    required this.addressModel,
  });

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    AddressModel addressModel = testMap(map, 'address',
        AddressModel(latitude: '', longitude: '', country: '', city: ''));

    return DoctorModel(
      id: testMap(map, 'id', 0),
      doctorName: testMap(map, 'doctorName', ''),
      doctorEmail: testMap(map, 'doctorEmail', ''),
      phoneNumber: testMap(map, 'phoneNumber', ''),
      doctorImageURL: testMap(map, 'doctorImageURL', ''),
      addressModel: addressModel,
    );
  }
}

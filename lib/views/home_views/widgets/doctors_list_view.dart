import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:luminouskey_task/constants/app_images.dart';
import 'package:luminouskey_task/constants/sizes.dart';
import 'package:luminouskey_task/controllers/home_provider.dart';
import 'package:luminouskey_task/utils/url_launcher.dart';
import 'package:luminouskey_task/views/map_pages/map_page.dart';

class DoctorsListView extends StatelessWidget {
  final HomePageProvider provider;
  final int index;

  const DoctorsListView({
    Key? key,
    required this.provider,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///----Top container
        Container(
          height: Sizes.height(context) / 4,
          margin: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(2, 3),
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              ///----Dr Image
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: Sizes.width(context) / 4,
                      height: Sizes.width(context) / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: provider
                                .doctorsModelList[index].doctorImageURL.isEmpty
                            ? Image.asset(
                                AppImages.doctor,
                                fit: BoxFit.cover,
                                scale: Sizes.allSize(context) / 220,
                              )
                            : Image.network(
                                provider.doctorsModelList[index].doctorImageURL,
                                fit: BoxFit.cover,
                                scale: Sizes.allSize(context) / 220,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    AppImages.noImage,
                                    fit: BoxFit.cover,
                                    scale: Sizes.allSize(context) / 220,
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              ),

              ///----Dr Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  ///----Dr. User Name
                  Text(
                    'Dr. ${provider.doctorsModelList[index].doctorName}',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.allSize(context) / 70,
                    ),
                  ),
                  const SizedBox(height: 20),

                  ///----Email
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          URLLauncherClass.sendEmail(
                              provider.doctorsModelList[index].doctorEmail);
                        },
                        child: Icon(
                          Icons.email_outlined,
                          size: Sizes.allSize(context) / 50,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: Sizes.width(context) / 2.8,
                        child: Text(
                          provider.doctorsModelList[index].doctorEmail,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: Sizes.allSize(context) / 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  ///----mobile
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          URLLauncherClass.phoneCall(
                              provider.doctorsModelList[index].phoneNumber);
                        },
                        child: Icon(
                          Icons.phone_android,
                          size: Sizes.allSize(context) / 50,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        provider.doctorsModelList[index].phoneNumber,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: Sizes.allSize(context) / 70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  ///----address
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (_) => MapPage(
                              doctorLatLng: LatLng(
                                double.parse(
                                  provider.doctorsModelList[index].addressModel
                                      .latitude,
                                ),
                                double.parse(provider.doctorsModelList[index]
                                    .addressModel.longitude),
                              ),
                            ),
                          );
                          Navigator.push(context, route);
                        },
                        child: Text(
                          '${provider.doctorsModelList[index].addressModel.city} - ${provider.doctorsModelList[index].addressModel.country}',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: Sizes.allSize(context) / 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        ///----Buttom container Row
        Container(
          height: Sizes.height(context) / 15,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(2, 3),
              ),
            ],
            color: Colors.cyan,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: Sizes.allSize(context) / 50,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Monday - June 22',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.allSize(context) / 80,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: Sizes.allSize(context) / 50,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '08:00 PM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.allSize(context) / 80,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

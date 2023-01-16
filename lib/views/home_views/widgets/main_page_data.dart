import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/sizes.dart';
import 'package:luminouskey_task/controllers/home_provider.dart';
import 'package:luminouskey_task/shared/home_text_field.dart';
import 'package:luminouskey_task/views/home_views/widgets/doctors_list_view.dart';
import 'package:luminouskey_task/views/home_views/widgets/upcoming_apointment_list.dart';

class MainPageData extends StatelessWidget {
  final HomePageProvider provider;

  const MainPageData({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.width(context),
      height: Sizes.height(context) / 1.15,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: Sizes.height(context) / 12),

          ///----User Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, ',
                style: TextStyle(
                  fontSize: Sizes.allSize(context) / 80,
                ),
              ),
              Text(
                'Ahmed',
                style: TextStyle(
                  fontSize: Sizes.allSize(context) / 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: Sizes.height(context) / 50),

          ///----User Location
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: Sizes.allSize(context) / 50,
              ),
              const SizedBox(width: 10),
              Text(
                'Zarqa, ',
                style: TextStyle(
                  fontSize: Sizes.allSize(context) / 80,
                ),
              ),
              Text(
                'Jordan',
                style: TextStyle(
                  fontSize: Sizes.allSize(context) / 80,
                ),
              ),
            ],
          ),

          SizedBox(height: Sizes.height(context) / 50),

          ///----TextFild
          const HomeTextField(hintText: 'Search Doctors, Health Issues'),

          SizedBox(height: Sizes.height(context) / 50),

          ///----Doctors ListView
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provider.doctorsModelList.length,
              itemBuilder: (context, index) {
                return DoctorsListView(provider: provider, index: index);
              },
            ),
          ),

          ///----Buttom Container
          const UpcomingApointmentList()
        ],
      ),
    );
  }
}

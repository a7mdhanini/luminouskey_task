import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/app_images.dart';
import 'package:luminouskey_task/constants/sizes.dart';

class UpcomingApointmentList extends StatelessWidget {
  const UpcomingApointmentList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height(context) / 4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 3,
            offset: const Offset(1, 2),
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          ///----Upcoming Apointment
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Apointment',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: Sizes.allSize(context) / 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: Sizes.allSize(context) / 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          ///----Upcoming Apointment List
          Row(
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                  width: Sizes.width(context) / 1.4,
                  height: Sizes.height(context) / 6,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: Sizes.width(context) / 3,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? Colors.pink.shade100
                              : Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(height: Sizes.height(context) / 30),
                            ///----Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                AppImages.doctor,
                                scale: Sizes.allSize(context) / 120,
                              ),
                            ),

                            ///----Dr. Name
                            Text(
                              'Dr. Ahmed al-hanini',
                              style: TextStyle(
                                fontSize: Sizes.allSize(context) / 100,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  size: Sizes.allSize(context) / 90,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Sunday - June 22',
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: Sizes.allSize(context) / 120,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: Sizes.allSize(context) / 90,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '08:00 PM',
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: Sizes.allSize(context) / 120,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Make a New',
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: Sizes.allSize(context) / 80,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

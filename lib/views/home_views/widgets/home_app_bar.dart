import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/sizes.dart';
import 'package:luminouskey_task/controllers/login_provider.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.width(context),
      height: Sizes.height(context),
      color: Colors.blue.shade300,
      child: Column(
        children: [
          SizedBox(height: Sizes.height(context) / 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///----Menu Dotted Icon
              InkWell(
                onTap: () {
                  Provider.of<LoginProvider>(context, listen: false)
                      .logOut(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Icon(
                    Icons.drag_indicator_outlined,
                    color: Colors.white,
                    size: Sizes.allSize(context) / 30,
                  ),
                ),
              ),

              ///----Message Notification Icons
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.messenger_outline,
                            color: Colors.white,
                            size: Sizes.allSize(context) / 40,
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.brightness_1,
                              color: Colors.cyan,
                              size: Sizes.allSize(context) / 70,
                            ),
                            Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.allSize(context) / 100,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(width: 10),

                    ///----Notification Icon
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                            size: Sizes.allSize(context) / 40,
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.brightness_1,
                              color: Colors.cyan,
                              size: Sizes.allSize(context) / 70,
                            ),
                            Text(
                              '5',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.allSize(context) / 100,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

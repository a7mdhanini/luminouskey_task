import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/app_images.dart';
import 'package:luminouskey_task/constants/sizes.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Sizes.height(context) / 14),
        Container(
          width: Sizes.width(context) / 4,
          height: Sizes.width(context) / 4,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(AppImages.doctor),
            ),
          ),
        ),
      ],
    );
  }
}

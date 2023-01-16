import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/app_images.dart';
import 'package:luminouskey_task/constants/sizes.dart';

class BackGround extends StatelessWidget {
  final String image;

  const BackGround({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.width(context),
      height: Sizes.height(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          // opacity: 0.6,
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}

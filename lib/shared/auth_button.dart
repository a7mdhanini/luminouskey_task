import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const AuthButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Sizes.width(context) / 1.3,
        height: Sizes.height(context) / 15,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontSize: Sizes.allSize(context) / 70,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/sizes.dart';

class HomeTextField extends StatelessWidget {
  final String? hintText;
  final String? prefixIcon;

  const HomeTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Sizes.width(context) / 1.3,
          height: Sizes.height(context) / 17,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 3,
                blurRadius: 9,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextFormField(
            textAlign: TextAlign.left,

            ///-------------///
            ///----Style----///
            ///-------------///
            style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.allSize(context) / 75,
            ),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: Sizes.allSize(context) / 75),
                prefixIconConstraints: const BoxConstraints(minWidth: 0),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.search,
                    size: Sizes.allSize(context) / 40,
                    color: Colors.grey.shade700,
                  ),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                disabledBorder: InputBorder.none),
          ),
        ),
        Container(
          width: Sizes.width(context) / 30,
          height: Sizes.height(context) / 17,
          decoration: const BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}

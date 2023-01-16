import 'package:flutter/material.dart';
import 'package:luminouskey_task/constants/sizes.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? suffixIcon;
  final Function()? visibilityOnTap;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const MyTextField({
    Key? key,
    required this.hintText,
    this.keyboardType,
    required this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.visibilityOnTap,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.width(context) / 1.3,
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        textAlign: TextAlign.left,

        ///-------------///
        ///----Style----///
        ///-------------///
        style: TextStyle(
          color: Colors.black,
          fontSize: Sizes.allSize(context) / 75,
        ),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 20),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: Sizes.allSize(context) / 75),
            prefixIconConstraints: const BoxConstraints(minWidth: 0),
            suffixIcon: InkWell(
              onTap: visibilityOnTap,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: (suffixIcon != null)
                    ? Icon(
                        suffixIcon,
                        size: Sizes.allSize(context) / 60,
                      )
                    : const SizedBox(),
              ),
            ),
            prefixIcon: (prefixIcon != null)
                ? Padding(
                    padding: const EdgeInsets.only(left: 12, right: 25, top: 5),
                    child: Icon(
                      prefixIcon,
                      size: Sizes.allSize(context) / 60,
                    ),
                  )
                : const SizedBox(),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            disabledBorder: InputBorder.none),
      ),
    );
  }
}

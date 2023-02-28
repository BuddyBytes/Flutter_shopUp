// ignore_for_file: constant_identifier_names, depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:shopup/ui/style/colors.dart';

Widget defaultFormField(
  bool isObscure, {
  required String hintText,
  required TextEditingController formController,
  required Icon formIcon,
  required bool showSuffixIcon,
}) {
  return TextFormField(
    obscureText: isObscure,
    cursorColor: Colors.black,
    controller: formController,
    decoration: InputDecoration(
      suffixIcon: showSuffixIcon ? IconButton(
        onPressed: () {
          
        },
        icon: const Icon(
          Icons.remove_red_eye_sharp,
        ),
      ) : null,
      suffixIconColor: defualtColor,
      prefixIcon: formIcon,
      prefixIconColor: defualtColor,
      hintText: hintText,
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(),
    ),
  );
}

//----------------------------------------------------------------

// toast message' colors

enum ToastMessageColor {
  success(
    toastColor: Colors.green,
  ),
  warning(
    toastColor: Colors.deepOrange,
  ),
  error(
    toastColor: Colors.red,
  );

  final Color toastColor;
  const ToastMessageColor({
    required this.toastColor,
  });
}

// toast widget

Future<bool?> toastWidget(
  String message, {
  required Color msgColor,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: msgColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

//----------------------------------------------------------------


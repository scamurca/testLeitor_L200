import 'package:flutter/material.dart';

Widget button({
  required BuildContext context,
  required Widget value,
  required Function()? doButton,
  Color? color,
  Color colorFont = Colors.black,
  double paddingHorizontal = 16.0,
  double paddingVertical = 8,
}) {
  // final ButtonStyle buttonStyle = TextButton.styleFrom(
  //   // primary: color == null ? Color.fromRGBO(1, 183, 210, 2) : color,
  //   elevation: 4,
  //   backgroundColor: color == null ? Color.fromRGBO(1, 183, 210, 2) : color,
  //   onSurface: Colors.grey,
  //   shadowColor: Colors.grey,
  //   minimumSize: Size(MediaQuery.of(context).size.width, 40),
  //   padding: EdgeInsets.symmetric(
  //     horizontal: paddingHorizontal,
  //     vertical: paddingVertical,
  //   ),
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(16.0)),
  //   ),
  // );

  // return TextButton(
  //   style: buttonStyle,
  //   onPressed: doButton,
  //   child: value,
  // );

  final ButtonStyle elevationStyle = ElevatedButton.styleFrom(
    // primary: color == null ? Color.fromRGBO(1, 183, 210, 2) : color,
    elevation: 4,
    // ignore: prefer_const_constructors
    primary: color ?? Color.fromRGBO(1, 183, 210, 2),
    onSurface: Colors.grey,
    shadowColor: Colors.grey,
    minimumSize: Size(MediaQuery.of(context).size.width, 40),
    padding: EdgeInsets.symmetric(
      horizontal: paddingHorizontal,
      vertical: paddingVertical,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
  );

  return ElevatedButton(
    style: elevationStyle,
    onPressed: doButton,
    child: value,
  );

  // final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //   // onPrimary: Colors.black87,
  //   elevation: 8,
  //   primary: color == null ? Color.fromRGBO(1, 183, 210, 2) : color,
  //   minimumSize: Size(MediaQuery.of(context).size.width, 40),
  //   padding: EdgeInsets.symmetric(
  //     horizontal: paddingHorizontal,
  //     vertical: paddingVertical,
  //   ),
  //   shape: const RoundedRectangleBorder(
  //     borderRadius: BorderRadius.all(Radius.circular(16)),
  //   ),
  // );

  // return ButtonTheme(
  //   minWidth: MediaQuery.of(context).size.width,
  //   child: ElevatedButton(
  //     style: raisedButtonStyle,
  //     child: Column(
  //       children: [
  //         value,
  //         // Text(
  //         //   '$value',
  //         //   style: TextStyle(
  //         //     color: Colors.white,
  //         //     fontWeight: FontWeight.bold,
  //         //     fontSize: 16,
  //         //   ),
  //         // ),
  //       ],
  //     ),
  //     onPressed: doButton,
  //   ),
  // );
}

import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle headerFont30 = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 30,
      height: 0.5,

      fontWeight: FontWeight.bold);

  static const TextStyle headerFont24 = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 24,
      height: 0.5,
      fontWeight: FontWeight.bold);
  static const TextStyle headerFont18 = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold);
  static const TextStyle headerFont14 = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold);

  static const TextStyle headerBody = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 10,
      height: 0.5,
      fontWeight: FontWeight.bold);

  static const TextStyle headerFooter = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 20,
      height: 0.5,
      fontWeight: FontWeight.w600);
}
abstract class SizedBoxConstraints {
  static  const SizedBox sizedBox18 = SizedBox(height: 18);
  static  const SizedBox sizedBox10 = SizedBox(height: 10);
  static  const SizedBox sizedBox5 = SizedBox(height: 5);
  static  const SizedBox sizedBox2 = SizedBox(width: 2,);
  static  const SizedBox sizedBox20 = SizedBox(height: 20);

}

abstract class Margins {
  static  const EdgeInsetsGeometry margin20 = EdgeInsets.only(top: 20,left: 10,right:10);
}
 const providePlaceHolder =   Placeholder(
    fallbackWidth: 50,
    fallbackHeight: 50,
    color: Colors.amberAccent,
    strokeWidth: 1.0
);
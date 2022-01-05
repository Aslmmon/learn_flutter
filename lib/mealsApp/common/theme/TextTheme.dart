import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle headerFont = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 30,
      height: 0.5,

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
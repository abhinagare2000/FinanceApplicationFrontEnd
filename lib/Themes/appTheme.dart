// Constants and imports
import 'package:flutter/material.dart';

/// Constants for styling and configuration
class AppTheme {
  static const primaryColor = Color(0xFF264653);
  static const backgroundColor = Color(0xFFece6f0);
  static const accentColor = Colors.white70;
  static const greenAccentColor = Colors.green;
  static const textColor = Colors.white70;

  static const cardPadding = EdgeInsets.only(top: 16, left: 12, right: 12);
  static const itemSpacing = 5.0;
  static const iconBackGroundPadding = EdgeInsets.all(12);
  static var iconBackGroundDecoration = BoxDecoration(
    color: const Color(0x1AFFFFFF),
    borderRadius: BorderRadius.circular(10),
  );

  static const titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: accentColor,
  );

  static const bodyStyle = TextStyle(color: textColor);
}

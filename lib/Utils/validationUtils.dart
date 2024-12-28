import 'dart:convert';

import 'package:crypto/crypto.dart';

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var hashedPassword = sha256.convert(bytes).toString();
  return hashedPassword;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your phone number';
  }
  final phoneRegex = RegExp(r'^\d{10}$');
  if (!phoneRegex.hasMatch(value)) {
    return 'Please enter a valid 10-digit phone number';
  }
  return null;
}

String? validateCapital(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the business capital';
  }
  final capitalRegex = RegExp(r'^\d+(\.\d{1,2})?$');
  if (!capitalRegex.hasMatch(value)) {
    return 'Please enter a valid amount';
  }
  return null;
}

String? validateBusinessType(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the business type';
  }
  return null;
}

String? validateDOI(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the date of incorporation';
  }
  final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  if (!dateRegex.hasMatch(value)) {
    return 'Please enter a valid date in YYYY-MM-DD format';
  }
  try {
    DateTime.parse(value);
  } catch (e) {
    return 'Please enter a valid date';
  }
  return null;
}


String? validateAge(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your age';
  }
  final age = int.tryParse(value);
  if (age == null || age <= 0) {
    return 'Please enter a valid age';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

String? validateBusinessName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the business name';
  }
  return null;
}

String? validateOtp(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the OTP';
  }
  final otpRegex = RegExp(r'^\d{6}$');
  if (!otpRegex.hasMatch(value)) {
    return 'Please enter a valid 6-digit OTP';
  }
  return null;
}
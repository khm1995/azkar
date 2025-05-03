import 'package:flutter/material.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension MediaQueryValue on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get toPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}

extension PhoneFormatter on String {
  String toFormattedPhone() {
    final clean = replaceAll(RegExp(r'[^\d+]'), ''); // Keep only digits and '+'

    if (!clean.startsWith('+')) return clean;

    if (clean.startsWith('+90') && clean.length == 13) {
      // Turkish number: +90 XXX XXX XXXX
      return '+90 ${clean.substring(3, 6)} ${clean.substring(6, 9)} ${clean.substring(9)}';
    } else if (clean.startsWith('+963') && clean.length == 13) {
      // Syrian number: +963 XXX XXX XXX
      return '+963 ${clean.substring(4, 7)} ${clean.substring(7, 10)} ${clean.substring(10)}';
    } else {
      // Generic fallback: split every 3 digits after country code
      final countryCode = clean.substring(0, 4);
      final rest = clean.substring(4);
      final chunks =
          RegExp(r'.{1,3}').allMatches(rest).map((m) => m.group(0)).join(' ');
      return '$countryCode $chunks';
    }
  }
}

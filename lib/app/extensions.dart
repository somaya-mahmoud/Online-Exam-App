import 'dart:math';

import 'package:flutter/material.dart';
import 'package:online_exam_app/app/constants.dart';

extension BuildContextExt on BuildContext {
  double width() => MediaQuery.of(this).size.width;

  double height() => MediaQuery.of(this).size.height;

  double minDim() =>
      min(MediaQuery.of(this).size.width, MediaQuery.of(this).size.height);
}

extension IntExt on int {
  Duration getMilliSec() {
    return Duration(milliseconds: this);
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZeroForInt() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return Constants.falseBool;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZeroForDouble() {
    if (this == null) {
      return Constants.zeroForD;
    } else {
      return this!;
    }
  }
}

import 'dart:io';

import 'package:app_utilities/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


/// All helper methods over [String] class
extension StringUtils on String {
  /// Parses and returns the string date (GMT) into [DateTime] representation
  ///
  /// Pass [local] as true to convert it into local time.
  /// In case of error returns null
  DateTime? toDateTime({bool local = false}) {
    try {
      var date = DateTime.parse(this);
      if (local) {
        return date.toLocal();
      } else {
        return date;
      }
    } catch (e, s) {
      debugPrint("$e: $s");
    }

    return null;
  }

  /// Parse and format the string date into formatted date string.
  /// Pass [SupportedDateFormat] to change the date format,
  /// In case of error returns empty string.
  String toFormattedDateTime(
      {SupportedDateFormat format = SupportedDateFormat.eeDdMmmmYyyy}) {
    return toDateTime() != null
        ? DateFormat(format.value).format(toDateTime(local: true)!)
        : '';
  }
}

/// All helper method over [BuildContext].
extension DeviceUtils on BuildContext {
  bool get isTablet {
    bool isPortrait = MediaQuery.of(this).orientation == Orientation.portrait;
    return MediaQuery.of(this).size.shortestSide >= (isPortrait ? 600 : 540);
  }

  bool get isPhone {
    bool isPortrait = MediaQuery.of(this).orientation == Orientation.portrait;
    return MediaQuery.of(this).size.shortestSide < (isPortrait ? 600 : 540);
  }

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isPortrait => orientation == Orientation.portrait;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isIPad => isTablet && !Platform.isAndroid;

  /// is dark mode currently enabled?
  bool get isDarkMode {
    final theme = Theme.of(this);
    // final brightness = MediaQuery.of(this).platformBrightness;
    return theme.brightness == Brightness.dark;
  }
}
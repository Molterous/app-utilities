import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// [AppTheme] to decorate your application for light and dark theme.
/// Call the constructor to provide your custom
/// color's scheme and the require font.
class AppTheme {

  /// TODO scope of optimization
  late final _MaterialTheme materialTheme;

  AppTheme({
    ColorScheme lightColorScheme = _lightColorScheme,
    ColorScheme darkColorScheme = _darkColorScheme,
    String fontFamily = "OpenSans"
  }) {
    materialTheme = _MaterialTheme(lightColorScheme, darkColorScheme, _AppTypo(fontFamily)._getTextTheme());
  }

  /// Light color scheme
  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xFF3362CC),
    primaryContainer: Color(0xFF316AD2),
    secondary: Color(0xFF407BFF),
    secondaryContainer: Color(0xFF407BFF),

    background: Color(0xFFFAFAFA),
    surface: Color(0xFFFFFFFF),
    error: Color(0xFFFFCFCB),

    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onBackground: Color(0xFF242424),
    onSurface: Color(0xFF242424),
    onError: Color(0xFFFFFFFF),

    brightness: Brightness.light,
  );

  /// Dark color scheme
  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: Color(0xFF4D83FF),
    primaryContainer: Color(0xFF4D83FF),
    secondary: Color(0xFF407BFF),
    secondaryContainer: Color(0xFF407BFF),

    background: Color(0xFF292929),
    surface: Color(0xFF373839),
    error: Color(0xFFFFCFCB),

    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onError: Color(0xFFFFFFFF),

    brightness: Brightness.dark,
  );
}

/// Generate the light and dark theme using [ColorScheme].
/// [light] theme for the app.
/// [dark] theme for the app.
/// [textTheme] for the app typo.
class _MaterialTheme {

  late final ThemeData light;
  late final ThemeData dark;
  late final TextTheme textTheme;

  _MaterialTheme(ColorScheme lightColorScheme, ColorScheme darkColorScheme, this.textTheme) {
    light = _themeData(lightColorScheme, textTheme);
    dark = _themeData(darkColorScheme, textTheme);
  }

  ThemeData _themeData(ColorScheme colorScheme, TextTheme textTheme) {

    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      cardColor: colorScheme.surface,
      canvasColor: colorScheme.background,
      dividerColor: colorScheme.onBackground,

      // Theme's
      textTheme: textTheme.apply(
          displayColor: colorScheme.onBackground,
          bodyColor: colorScheme.onBackground
      ),
    );
  }
}

/// Generate the [TextTheme] using the [Font], [FontWeight]
/// and [FontStyle] for the app.
class _AppTypo {

  // FontFamily
  final String                  _fontFamily;

  // FontWeight
  final FontWeight _regular     = FontWeight.w400;
  final FontWeight _medium      = FontWeight.w500;
  final FontWeight _semiBold    = FontWeight.w600;
  final FontWeight _bold        = FontWeight.w700;

  // FontStyle
  final FontStyle _normal       = FontStyle.normal;
  final FontStyle _italic       = FontStyle.italic;

  static final double _sizeNormal      = 11.0.sp;
  static final double _sizeLarge       = _sizeNormal + 2.0.sp;
  static final double _sizeExtraLarge  = _sizeNormal + 4.0.sp;
  static final double _sizeVeryLarge   = _sizeNormal + 6.0.sp;
  static final double _sizeSmall       = _sizeNormal - 2.0.sp;

  _AppTypo(this._fontFamily);

  TextTheme _getTextTheme() {

    return TextTheme(
      displayLarge: TextStyle(             // (h1 w700, s17),
        fontFamily: _fontFamily,
        fontWeight: _bold,
        fontStyle: _normal,
        fontSize: _sizeVeryLarge,
      ),
      displayMedium: TextStyle(           // (h2 w600, s15)
          fontFamily: _fontFamily,
          fontWeight: _semiBold,
          fontStyle: _normal,
          fontSize: _sizeExtraLarge
      ),
      displaySmall: TextStyle(            // (h3 w700, s13)
          fontFamily: _fontFamily,
          fontWeight: _bold,
          fontStyle: _normal,
          fontSize: _sizeLarge
      ),
      headlineMedium: TextStyle(           // (h4 w600, s13)
          fontFamily: _fontFamily,
          fontWeight: _semiBold,
          fontStyle: _normal,
          fontSize: _sizeLarge
      ),
      headlineSmall: TextStyle(            // (h5 w500, s13)
          fontFamily: _fontFamily,
          fontWeight: _medium,
          fontStyle: _normal,
          fontSize: _sizeLarge
      ),
      titleLarge: TextStyle(               // (h6 w700, s11)
          fontFamily: _fontFamily,
          fontWeight: _bold,
          fontStyle: _normal,
          fontSize: _sizeNormal
      ),
      bodyLarge: TextStyle(               // (h6 w400, s13)
          fontFamily: _fontFamily,
          fontWeight: _regular,
          fontStyle: _normal,
          fontSize: _sizeLarge
      ),
      bodyMedium: TextStyle(               // (h6 w400, s11)
          fontFamily: _fontFamily,
          fontWeight: _regular,
          fontStyle: _normal,
          fontSize: _sizeNormal
      ),
      bodySmall: TextStyle(                // (h6 w400, s9)
          fontFamily: _fontFamily,
          fontWeight: _regular,
          fontStyle: _normal,
          fontSize: _sizeSmall
      ),
      labelLarge: TextStyle(               // (h6 w700, s11)
          fontFamily: _fontFamily,
          fontWeight: _bold,
          fontStyle: _normal,
          fontSize: _sizeNormal
      ),
    );
  }
}

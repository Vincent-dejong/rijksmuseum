import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String colorCode) {
    colorCode = colorCode.replaceAll("#", "");
    if (colorCode.length == 6) {
      colorCode = "FF" + colorCode;
    }

    return int.parse("0x$colorCode");
  }

  HexColor(final String colorCode) : super(_getColorFromHex(colorCode));
}

class HexMaterialColor extends MaterialColor {
  HexMaterialColor(final String colorCode)
      : super(HexColor._getColorFromHex(colorCode), {
          50: HexColor(colorCode),
          100: HexColor(colorCode),
          200: HexColor(colorCode),
          300: HexColor(colorCode),
          400: HexColor(colorCode),
          500: HexColor(colorCode),
          600: HexColor(colorCode),
          700: HexColor(colorCode),
          800: HexColor(colorCode),
          900: HexColor(colorCode),
        });
}

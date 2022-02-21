import 'package:flutter/material.dart';

final double gridElementHeight = 110;
final double gridElementWidth = 150;

const Color PrimaryColor = Color(0xFFFDCB52);
const Color AccentColor = Color(0xFFB6D032);
const Color BackgroundColor = Color(0xFFFEFBF8);
const Color DarkColor = Color(0xFF141819);
const Color TextColor = Color(0xFF272041);

const Color GreyColorText = Color(0xFF938FA0);

ThemeData getTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    accentColor: AccentColor,
    accentColorBrightness: Brightness.dark,

    primaryColor: PrimaryColor,
    primaryColorBrightness: Brightness.light,

    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: PrimaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      highlightColor: Colors.transparent,
      focusColor: PrimaryColor,
      hoverColor: PrimaryColor,
      minWidth: 0.0,
    ),

    scaffoldBackgroundColor: BackgroundColor,
    cardColor: DarkColor,
    backgroundColor: BackgroundColor,

    // remove material effect on touch (circles)
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,

    // title home page
    textTheme: base.textTheme.copyWith(
        headline1: TextStyle(
            color: TextColor,
            fontFamily: 'Damion',
            fontSize: 60,
            letterSpacing: 0.0,
            height: 0.9),
        headline3: TextStyle(
            color: PrimaryColor,
            fontFamily: 'Damion',
            fontSize: 30,
            letterSpacing: 0.0),
        headline4: TextStyle(
            fontFamily: 'Inter',
            color: GreyColorText,
            fontSize: 16,
            fontWeight: FontWeight.w300),
        headline5: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.lineThrough),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        subtitle1: TextStyle(
            fontFamily: 'Inter',
            color: TextColor,
            fontSize: 18,
            fontWeight: FontWeight.w300),
        subtitle2: TextStyle(
            fontFamily: 'Inter',
            color: TextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600)),
  );
}

class CardTextStyle {
  static TextStyle headline1(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 25,
        fontFamily: 'Inter',
        color: TextColor,
        fontWeight: FontWeight.w800);
  }

  static TextStyle headline2(BuildContext context) {
    return Theme.of(context).textTheme.headline2!.copyWith(
          fontSize: 16,
          fontFamily: 'Inter',
          color: GreyColorText,
        );
  }

  static TextStyle headline3(BuildContext context) {
    return Theme.of(context).textTheme.headline3!.copyWith(
          fontSize: 16,
          fontFamily: 'Inter',
          color: TextColor,
        );
  }

  static TextStyle headline5(BuildContext context) {
    return Theme.of(context).textTheme.headline5!.copyWith(
          fontSize: 16,
          fontFamily: 'Inter',
          color: TextColor,
        );
  }
}

class ListViewStyle {
  static TextStyle headline1(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 18,
        fontFamily: 'Inter',
        color: TextColor,
        fontWeight: FontWeight.w800);
  }

  static TextStyle headline2(BuildContext context) {
    return Theme.of(context).textTheme.headline2!.copyWith(
        fontSize: 18,
        fontFamily: 'Inter',
        color: TextColor,
        fontWeight: FontWeight.w300);
  }

  static TextStyle headline5(BuildContext context) {
    return Theme.of(context).textTheme.headline5!.copyWith(
        fontSize: 18,
        fontFamily: 'Inter',
        color: TextColor,
        fontWeight: FontWeight.w800);
  }
}

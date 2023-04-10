import 'package:flutter/material.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {

  static CustomThemeExtension lightMode = CustomThemeExtension(
    circleImageColor: Colors.blue,
    greyColor: Colors.grey,
    blueColor: Colors.blue,
    langBtnBgColor: Colors.white,
    langBtnHighlightColor: Colors.white,
    authAppbarTextColor:Colors.black,
    photoIconColor:Colors.grey,
    photoIconBgColor:Colors.white,
  );

  static CustomThemeExtension darkMode = CustomThemeExtension(
    blueColor: Colors.blue,
    circleImageColor: Colors.white,
    greyColor: Colors.grey,
    langBtnBgColor: Colors.white,
    langBtnHighlightColor: Colors.white,
    authAppbarTextColor:Colors.white,
    photoIconBgColor:Colors.white,
    photoIconColor:Colors.grey,
  );

  final Color? circleImageColor;
  final Color? greyColor; 
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighlightColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;

  CustomThemeExtension(
      {this.circleImageColor,
      this.greyColor,
      this.blueColor,
      this.langBtnBgColor,
      this.langBtnHighlightColor,
      this.authAppbarTextColor,
      this.photoIconBgColor, 
      this.photoIconColor, 
      });
  @override
  ThemeExtension<CustomThemeExtension> copyWith(
{  Color? circleImageColor,
  Color? greyColor,
  Color? blueColor,
  Color? langBtnBgColor,
  Color? langBtnHighlightColor,
  Color? authAppbarTextColor,
  Color? photoIconBgColor,
  Color? photoIconColor,
  }
  ) {
    // TODO: implement copyWith
    return CustomThemeExtension(
      circleImageColor: circleImageColor ?? this.circleImageColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighlightColor: langBtnHighlightColor ?? this.langBtnHighlightColor,
      authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
      photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
      photoIconColor: photoIconColor ?? this.photoIconColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    // TODO: implement lerp
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
      langBtnHighlightColor: Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t),
      authAppbarTextColor: Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
    );
  }
}

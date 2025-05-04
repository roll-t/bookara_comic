import 'package:bookara/core/config/const/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final List<Shadow>? listShadow;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final String? fontFamily;

  const TextWidget({
    super.key,
    this.textAlign,
    this.listShadow,
    this.maxLines = 1000,
    required this.text,
    this.color,
    this.size = AppDimens.fontSizeMedium,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.fontFamily, // Initialize the fontFamily parameter
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily ?? "Roboto",
        color: color,
        fontSize: size,
        fontStyle: fontStyle,
        shadows: listShadow,
        fontWeight: fontWeight,
        decoration: textDecoration,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

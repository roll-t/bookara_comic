import 'package:bookara/core/config/const/app_icons.dart';
import 'package:flutter_svg/svg.dart';

class Utils {
  static SvgPicture iconSvg({String? svgUrl, double size = 25}) {
    return SvgPicture.asset(
      svgUrl ?? AppIcons.icNotUrl,
      width: size,
      height: size,
    );
  }
}

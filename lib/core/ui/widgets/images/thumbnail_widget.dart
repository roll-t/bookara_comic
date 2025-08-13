import 'package:bookara/core/config/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ThumbnailWidget extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final double borderWidth;
  final double? height;

  const ThumbnailWidget({
    super.key,
    required this.imageUrl,
    this.borderRadius = 3.0,
    this.borderWidth = 1.0,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: AppColors.grey.withOpacity(.5),
          width: borderWidth,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: "https://img.otruyenapi.com/uploads/comics/$imageUrl",
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: (context, url) => const ColoredBox(
            color: AppColors.text500,
            child: Icon(
              Icons.image,
              color: AppColors.text300,
              size: 50,
            ),
          ),
          errorWidget: (context, url, error) => const ColoredBox(
            color: AppColors.text500,
            child: Icon(
              Icons.image,
              color: AppColors.text300,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}

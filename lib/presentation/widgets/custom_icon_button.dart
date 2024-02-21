import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_size.dart';

class CustomIconButton extends StatelessWidget {
  final String iconData;
  final String text;
  final VoidCallback onTap;

  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.myHeight(context) * 0.07,
        width: AppSize.myWidth(context) * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: AppColors.cardBackColor,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              iconData,
              color: AppColors.floatButtonColor,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: AppColors.floatButtonColor,
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: AppSize.myHeight(context) * 0.3,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.floatButtonColor,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
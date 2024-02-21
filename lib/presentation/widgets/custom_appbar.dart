import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_size.dart';

class CustomAppBar extends StatelessWidget {
  final String leftIconPath;
  final String title;
  final VoidCallback onLeftIconPressed;
  final bool showIconButton;
  final Color backgroundColor;
  final Color textColor;

  CustomAppBar({
    super.key,
    required this.leftIconPath,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.showIconButton, 
    required this.onLeftIconPressed,
  }) : assert(leftIconPath.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      width: AppSize.myWidth(context),
      height: AppSize.myHeight(context) * 0.14,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showIconButton)
          IconButton(
            onPressed: onLeftIconPressed,
            splashColor: Colors.transparent,
            icon: SvgPicture.asset(
              leftIconPath,
              colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
              width: 22.0,
              height: 22.0,
            ),
          ),
          const SizedBox(width: 15),
          Center(
            child: Text(
              title,
              maxLines: 2,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 28,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

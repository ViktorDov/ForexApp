
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  final void Function(int) onItemTapped;
  final int selectedIndex;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      SvgPicture.asset(
        'assets/logo/mn.svg',
        width: 26.0,
        height: 26.0,
        color: selectedIndex == 0
            ? AppColors.floatButtonColor
            : AppColors.floatButtonColor,
      ),
      SvgPicture.asset(
        'assets/logo/bookopen.svg',
        width: 26.0,
        height: 26.0,
        color: selectedIndex == 1
            ? AppColors.floatButtonColor
            : AppColors.floatButtonColor,
      ),
      SvgPicture.asset(
        'assets/logo/lampa.svg',
        width: 26.0,
        height: 26.0,
        color: selectedIndex == 2
            ? AppColors.floatButtonColor
            : AppColors.floatButtonColor,
      ),
      SvgPicture.asset(
        'assets/logo/iconuser.svg',
        width: 25.0,
        height: 25.0,
        color: selectedIndex == 3
            ? AppColors.floatButtonColor
            : AppColors.floatButtonColor,
      ),
    ];

    return CurvedNavigationBar(
      backgroundColor: AppColors.floatButtonColor,
      color: Colors.white,
      buttonBackgroundColor: AppColors.contrastTextColor,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      index: selectedIndex,
      items: items,
      onTap: onItemTapped,
    );
  }
}
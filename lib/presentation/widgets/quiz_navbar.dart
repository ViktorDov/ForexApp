import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class QuizNavBar extends StatelessWidget {
  final int currentPage;
  final VoidCallback forward;
  final VoidCallback back;
  final bool isButtonEnabled;

  const QuizNavBar({
    super.key,
    required this.currentPage,
    required this.isButtonEnabled,
    required this.forward,
    required this.back,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Шаг ${currentPage + 1} из 6:',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => _buildCircle(
                        filled: index <= currentPage ? true : false),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.grey,
                backgroundColor: Colors.white,
                shape: const CircleBorder(
                  side: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              onPressed: back,
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.grey[400],
                size: 19,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: AppColors.floatButtonColor,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(
                      color: AppColors.floatButtonColor, width: 1.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              ),
              onPressed: isButtonEnabled ? forward : null,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Далее",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.floatButtonColor,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildCircle({required bool filled}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    width: 10.0,
    height: 10.0,
    decoration: BoxDecoration(
      color: filled ? AppColors.backgraundSecondColor : Colors.transparent,
      border: Border.all(color: AppColors.backgraundSecondColor, width: 1.0),
      shape: BoxShape.circle,
    ),
  );
}

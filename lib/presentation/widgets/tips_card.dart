import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../domain/entity/tips.dart';


class TipsCard extends StatelessWidget {
  final Tips tips;
  final VoidCallback onTap;

  const TipsCard({super.key, required this.tips, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: FadeInImage.assetNetwork(
                height: 250,
                placeholder: 'assets/logo/spinner.gif',
                placeholderFit: BoxFit.cover,
                fadeInCurve: Curves.easeInBack,
                placeholderScale: 1,
                image: tips.imageUrl,
                fit: BoxFit.fill,
                imageScale: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              tips.title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Poppins'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 18, right: 18),
            child: Text(
              tips.description,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              color: AppColors.cardBackColor,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tips.createdAt,
                    style: const TextStyle(
                      color: AppColors.activeTextColor,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    )),
                GestureDetector(
                  onTap: onTap,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Подробнее',
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueAccent),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blueAccent,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

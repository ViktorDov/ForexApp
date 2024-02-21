import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_size.dart';
import '../../../domain/entity/strategy_details.dart';

class AboutScreen extends StatefulWidget {
  final StrategyDetails strategyDetails;
  const AboutScreen({super.key, required this.strategyDetails});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: AppColors.backgraundColor,
                width: AppSize.myWidth(context),
                child: Text(
                  widget.strategyDetails.aboutTitle,
                  style: const TextStyle(
                  color: AppColors.floatButtonColor,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                color: AppColors.backgraundColor,
                width: AppSize.myWidth(context),
                child: Text(
                  widget.strategyDetails.aboutDefinition,
                  style: const TextStyle(
                  height: 1.5,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
                ),
              ),
              if (widget.strategyDetails.aboutImage.isNotEmpty)
                Image.network(widget.strategyDetails.aboutImage),
            ],
          )),
    );
  }
}
